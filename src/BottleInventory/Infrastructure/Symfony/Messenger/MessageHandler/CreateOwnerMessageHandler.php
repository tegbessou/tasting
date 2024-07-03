<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Messenger\MessageHandler;

use App\BottleInventory\Application\Command\CreateOwnerCommand;
use App\BottleInventory\Domain\Exception\OwnerAlreadyExistException;
use App\BottleInventory\Domain\Exception\OwnerDoesntExistInSecurityException;
use App\BottleInventory\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;

#[AsMessageHandler]
final readonly class CreateOwnerMessageHandler
{
    public function __construct(
        private CommandBusInterface $commandBus,
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
        } catch (OwnerAlreadyExistException|OwnerDoesntExistInSecurityException) {
            throw new UnrecoverableMessageHandlingException();
        }
    }
}
