<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\SendInvitationCommand;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;

#[AsMessageHandler]
final readonly class SendInvitationMessageHandler
{
    public function __construct(
        private CommandBusInterface $bus,
    ) {
    }

    public function __invoke(InvitationCreatedMessage $invitationCreatedMessage): void
    {
        Assert::uuid($invitationCreatedMessage->invitationId);
        Assert::string($invitationCreatedMessage->invitationId);
        Assert::lengthBetween($invitationCreatedMessage->invitationId, 36, 36);
        Assert::email($invitationCreatedMessage->targetEmail);
        Assert::maxLength($invitationCreatedMessage->targetEmail, 255);
        Assert::email($invitationCreatedMessage->ownerEmail);
        Assert::maxLength($invitationCreatedMessage->ownerEmail, 255);
        Assert::uuid($invitationCreatedMessage->bottleId);
        Assert::string($invitationCreatedMessage->bottleId);
        Assert::lengthBetween($invitationCreatedMessage->bottleId, 36, 36);

        $this->bus->dispatch(
            new SendInvitationCommand(
                $invitationCreatedMessage->invitationId,
                $invitationCreatedMessage->targetEmail,
                $invitationCreatedMessage->ownerEmail,
                $invitationCreatedMessage->bottleId,
            )
        );
    }
}
