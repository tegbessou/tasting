<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use App\Security\Application\Command\LogInUserServiceCommand;
use App\Security\Domain\Exception\ExpiredTokenException;
use App\Security\Domain\Exception\InvalidPayloadException;
use App\Security\Domain\Exception\InvalidTokenException;
use App\Security\Infrastructure\ApiPlatform\Resource\AuthorizeTokenResource;
use App\Security\Infrastructure\ApiPlatform\Resource\UserResource;
use App\Shared\Application\Command\CommandBusInterface;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Webmozart\Assert\Assert;

/**
 * @implements ProcessorInterface<UserResource, AuthorizeTokenResource>
 */
#[WithMonologChannel('security')]
final readonly class LogInUserProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = [])
    {
        Assert::isInstanceOf($data, UserResource::class);
        Assert::notNull($data->email);
        Assert::notNull($data->password);

        try {
            $userAuthenticated = $this->commandBus->dispatch(
                new LogInUserServiceCommand(
                    $data->email,
                    $data->password,
                ),
            );
        } catch (InvalidTokenException $exception) {
            $this->logger->error(
                'Log in user: Invalid token',
                [
                    'exception' => $exception,
                    'provider' => 'firebase',
                ],
            );

            throw new AuthenticationException($exception->getMessage());
        } catch (ExpiredTokenException $exception) {
            $this->logger->error(
                'Log in user: Token expired',
                [
                    'exception' => $exception,
                    'provider' => 'firebase',
                ],
            );

            throw new AuthenticationException($exception->getMessage());
        } catch (InvalidPayloadException $exception) {
            $this->logger->error(
                'Log in user: Invalid payload',
                [
                    'exception' => $exception,
                    'provider' => 'firebase',
                ],
            );

            throw new AuthenticationException($exception->getMessage());
        }

        return AuthorizeTokenResource::fromValue($userAuthenticated);
    }
}
