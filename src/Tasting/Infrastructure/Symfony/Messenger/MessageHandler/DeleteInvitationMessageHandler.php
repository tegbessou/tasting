<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\DeleteInvitationCommand;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationStatusChangedInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;

#[AsMessageHandler]
final readonly class DeleteInvitationMessageHandler
{
    public function __construct(
        private CommandBusInterface $commandBus,
    ) {
    }

    public function __invoke(
        InvitationStatusChangedInterface $invitationAcceptedMessage,
    ): void {
        Assert::uuid($invitationAcceptedMessage->getInvitationId());

        $this->commandBus->dispatch(
            new DeleteInvitationCommand($invitationAcceptedMessage->getInvitationId()),
        );
    }
}
