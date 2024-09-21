<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationCreated;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationRejectedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBroker implements MessageBrokerInterface
{
    public function __construct(
        private MessageBusInterface $eventBus,
    ) {
    }

    #[\Override]
    public function dispatchInvitationCreatedMessage(InvitationCreated $event): void
    {
        $this->eventBus->dispatch(
            InvitationCreatedMessage::fromEvent($event),
        );
    }

    #[\Override]
    public function dispatchInvitationAccepted(InvitationAccepted $event): void
    {
        $this->eventBus->dispatch(
            InvitationAcceptedMessage::fromEvent($event),
        );
    }

    #[\Override]
    public function dispatchInvitationRejected(InvitationRejected $event): void
    {
        $this->eventBus->dispatch(
            InvitationRejectedMessage::fromEvent($event),
        );
    }
}
