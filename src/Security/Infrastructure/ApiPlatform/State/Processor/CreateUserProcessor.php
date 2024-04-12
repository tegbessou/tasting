<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Symfony\Validator\Exception\ValidationException;
use App\Security\Application\Command\CreateUserCommand;
use App\Security\Domain\Exception\UserAlreadyExistsException;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Infrastructure\ApiPlatform\Resource\UserResource;
use App\Security\Infrastructure\Symfony\Validator\ConstraintViolation\BuildUserAlreadyExistConstraintViolation;
use App\Shared\Application\Command\CommandBusInterface;
use Webmozart\Assert\Assert;

/**
 * @implements ProcessorInterface<UserResource, void>
 */
final readonly class CreateUserProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private BuildUserAlreadyExistConstraintViolation $buildUserAlreadyExistConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::isInstanceOf($data, UserResource::class);
        Assert::notNull($data->email);

        try {
            $this->commandBus->dispatch(
                new CreateUserCommand(
                    UserEmail::fromString($data->email)
                ),
            );
        } catch (UserAlreadyExistsException) {
            throw new ValidationException($this->buildUserAlreadyExistConstraintViolation->build($data->email));
        }
    }
}
