<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Tasting\Application\Command\SendInvitationCommand;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

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
        Assert::string($invitationCreatedMessage->bottleName);
        Assert::maxLength($invitationCreatedMessage->bottleName, 255);

        $this->bus->dispatch(
            new SendInvitationCommand(
                $invitationCreatedMessage->invitationId,
                $invitationCreatedMessage->targetEmail,
                $invitationCreatedMessage->ownerEmail,
                $invitationCreatedMessage->bottleName,
            )
        );
    }
}
