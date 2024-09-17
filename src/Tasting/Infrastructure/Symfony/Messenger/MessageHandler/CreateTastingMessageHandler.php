<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\CreateTastingCommand;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;

#[AsMessageHandler]
final readonly class CreateTastingMessageHandler
{
    public function __construct(
        private CommandBusInterface $bus,
    ) {
    }

    public function __invoke(BottleTastedMessage $bottleTastedMessage): void
    {
        Assert::string($bottleTastedMessage->bottleName);
        Assert::maxLength($bottleTastedMessage->bottleName, 255);
        Assert::email($bottleTastedMessage->ownerEmail);
        Assert::maxLength($bottleTastedMessage->ownerEmail, 255);

        try {
            $this->bus->dispatch(new CreateTastingCommand(
                $bottleTastedMessage->bottleName,
                $bottleTastedMessage->ownerEmail,
            ));
        } catch (OwnerDoesntExistException) {
            throw new UnrecoverableMessageHandlingException();
        }
    }
}
