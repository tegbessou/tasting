<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use App\Security\Application\Command\CreateUserCommand;
use App\Security\Application\Query\GetUserQuery;
use App\Security\Domain\Exception\UserAlreadyExistsException;
use App\Security\Infrastructure\ApiPlatform\Resource\UserResource;
use App\Security\Infrastructure\Symfony\Validator\ConstraintViolation\BuildUserAlreadyExistConstraintViolation;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Application\Query\QueryBusInterface;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Webmozart\Assert\Assert;

/**
 * @implements ProcessorInterface<UserResource, void>
 */
#[WithMonologChannel('security')]
final readonly class CreateUserProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private BuildUserAlreadyExistConstraintViolation $buildUserAlreadyExistConstraintViolation,
        private LoggerInterface $logger, private QueryBusInterface $queryBus,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): UserResource
    {
        Assert::isInstanceOf($data, UserResource::class);
        Assert::notNull($data->email);

        try {
            $userEmail = $this->commandBus->dispatch(
                new CreateUserCommand(
                    $data->email,
                ),
            );
        } catch (UserAlreadyExistsException $exception) {
            $this->logger->error(
                'Create user: User already exists',
                [
                    'email' => $exception->email,
                ],
            );

            throw new ValidationException($this->buildUserAlreadyExistConstraintViolation->build($data->email));
        } catch (\InvalidArgumentException $exception) {
            $this->logger->error(
                'Create user: Invalid argument',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }

        $user = $this->queryBus->ask(
            new GetUserQuery($userEmail),
        );

        return UserResource::fromModel($user);
    }
}
