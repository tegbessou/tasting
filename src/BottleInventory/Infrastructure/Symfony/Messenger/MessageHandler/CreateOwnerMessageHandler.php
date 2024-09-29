<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Messenger\MessageHandler;

use App\BottleInventory\Application\Command\CreateOwnerCommand;
use App\BottleInventory\Domain\Exception\OwnerAlreadyExistException;
use App\BottleInventory\Domain\Exception\OwnerDoesntExistInSecurityException;
use App\BottleInventory\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[AsMessageHandler]
#[WithMonologChannel('bottle_inventory')]
final readonly class CreateOwnerMessageHandler
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(UserCreatedMessage $createdMessage): void
    {
        Assert::email($createdMessage->email);
        Assert::maxLength($createdMessage->email, 255);
        Assert::string($createdMessage->fullName);
        Assert::maxLength($createdMessage->fullName, 255);

        try {
            $this->commandBus->dispatch(
                new CreateOwnerCommand(
                    $createdMessage->email,
                    $createdMessage->fullName,
                ),
            );
        } catch (OwnerDoesntExistInSecurityException $exception) {
            $this->logger->error(
                'Create owner: Owner not found in security bounded context',
                [
                    'email' => $exception->email,
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        } catch (OwnerAlreadyExistException $exception) {
            $this->logger->error(
                'Create owner: Owner already exists',
                [
                    'email' => $exception->email,
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        } catch (\InvalidArgumentException $exception) {
            $this->logger->error(
                'Create owner: Owner creation failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
