<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Service\MessageBrokerServiceInterface;
use App\Tasting\Domain\Event\InvitationAcceptedEvent;
use App\Tasting\Domain\Event\InvitationCreatedEvent;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBrokerService implements MessageBrokerServiceInterface
{
    public function __construct(
        private MessageBusInterface $eventBus,
    ) {
    }

    #[\Override]
    public function dispatchInvitationCreatedMessage(InvitationCreatedEvent $event): void
    {
        $this->eventBus->dispatch(
            InvitationCreatedMessage::fromEvent($event),
        );
    }

    #[\Override]
    public function dispatchInvitationAccepted(InvitationAcceptedEvent $event): void
    {
        $this->eventBus->dispatch(
            InvitationAcceptedMessage::fromEvent($event),
        );
    }
}
