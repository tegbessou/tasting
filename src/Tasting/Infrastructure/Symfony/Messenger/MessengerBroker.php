<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Event\TastingDeleted;
use App\Tasting\Domain\Event\TastingParticipantInvited;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\CreateBottleForParticipantWhenInvitationIsAcceptedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenInvitationIsAcceptedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenTastingIsCreatedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationRejectedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\TastingDeletedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBroker implements MessageBrokerInterface
{
    public function __construct(
        private MessageBusInterface $eventBus,
    ) {
    }

    #[\Override]
    public function dispatchInvitationCreatedMessage(TastingParticipantInvited $event): void
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

    #[\Override]
    public function dispatchCreateSheetWhenInvitationIsAccepted(InvitationAccepted $event): void
    {
        $this->eventBus->dispatch(
            CreateSheetWhenInvitationIsAcceptedMessage::fromEvent($event),
        );
    }

    #[\Override]
    public function dispatchCreateSheetWhenTastingIsCreated(TastingCreated $event): void
    {
        $this->eventBus->dispatch(
            CreateSheetWhenTastingIsCreatedMessage::fromEvent($event),
        );
    }

    #[\Override]
    public function dispatchTastingDeleted(TastingDeleted $event): void
    {
        $this->eventBus->dispatch(
            TastingDeletedMessage::fromEvent($event),
        );
    }

    #[\Override]
    public function dispatchDuplicateBottleWhenInvitationIsAcceptedTastingDeleted(InvitationAccepted $event): void
    {
        $this->eventBus->dispatch(
            CreateBottleForParticipantWhenInvitationIsAcceptedMessage::fromEvent($event),
        );
    }
}
