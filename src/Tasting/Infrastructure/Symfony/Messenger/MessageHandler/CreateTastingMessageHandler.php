<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\CreateTastingCommand;
use App\Tasting\Domain\Exception\BottleDoesntExistException;
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
        Assert::uuid($bottleTastedMessage->bottleId);
        Assert::string($bottleTastedMessage->bottleId);
        Assert::lengthBetween($bottleTastedMessage->bottleId, 36, 36);
        Assert::email($bottleTastedMessage->ownerEmail);
        Assert::maxLength($bottleTastedMessage->ownerEmail, 255);

        try {
            $this->bus->dispatch(new CreateTastingCommand(
                $bottleTastedMessage->bottleId,
                $bottleTastedMessage->ownerEmail,
            ));
        } catch (BottleDoesntExistException|OwnerDoesntExistException) {
            throw new UnrecoverableMessageHandlingException();
        }
    }
}
