<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use EmpireDesAmis\Tasting\Application\Command\DeleteInvitationCommand;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationStatusChangedInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[AsMessageHandler]
final readonly class DeleteInvitationMessageHandler
{
    public function __construct(
        private CommandBusInterface $commandBus,
    ) {
    }

    public function __invoke(
        InvitationStatusChangedInterface $invitationStatusChangedMessage,
    ): void {
        Assert::uuid($invitationStatusChangedMessage->getTastingId());
        Assert::uuid($invitationStatusChangedMessage->getInvitationId());

        $this->commandBus->dispatch(
            new DeleteInvitationCommand(
                $invitationStatusChangedMessage->getTastingId(),
                $invitationStatusChangedMessage->getInvitationId(),
            ),
        );
    }
}
