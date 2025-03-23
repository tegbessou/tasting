<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use EmpireDesAmis\Tasting\Application\Command\SendInvitationCommand;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
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
        Assert::uuid($invitationCreatedMessage->tastingId);
        Assert::string($invitationCreatedMessage->tastingId);
        Assert::lengthBetween($invitationCreatedMessage->tastingId, 36, 36);
        Assert::uuid($invitationCreatedMessage->invitationId);
        Assert::string($invitationCreatedMessage->invitationId);
        Assert::lengthBetween($invitationCreatedMessage->invitationId, 36, 36);

        $this->bus->dispatch(
            new SendInvitationCommand(
                $invitationCreatedMessage->tastingId,
                $invitationCreatedMessage->invitationId,
            )
        );
    }
}
