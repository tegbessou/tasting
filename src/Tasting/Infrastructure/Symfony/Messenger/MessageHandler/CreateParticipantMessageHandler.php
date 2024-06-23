<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\CreateParticipantCommand;
use App\Tasting\Domain\Exception\ParticipantAlreadyExistException;
use App\Tasting\Domain\Exception\ParticipantDoesntExistInSecurityException;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;

#[AsMessageHandler]
final readonly class CreateParticipantMessageHandler
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
                new CreateParticipantCommand(
                    $createdMessage->email,
                    $createdMessage->fullName,
                ),
            );
        } catch (ParticipantAlreadyExistException|ParticipantDoesntExistInSecurityException $e) {
            throw new UnrecoverableMessageHandlingException();
        }
    }
}
