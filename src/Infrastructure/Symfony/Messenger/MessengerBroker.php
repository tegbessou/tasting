<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger;

use EmpireDesAmis\Tasting\Application\Service\MessageBrokerInterface;
use EmpireDesAmis\Tasting\Domain\Event\InvitationAccepted;
use EmpireDesAmis\Tasting\Domain\Event\InvitationRejected;
use EmpireDesAmis\Tasting\Domain\Event\TastingCreated;
use EmpireDesAmis\Tasting\Domain\Event\TastingDeleted;
use EmpireDesAmis\Tasting\Domain\Event\TastingParticipantInvited;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\CreateBottleForParticipantWhenInvitationIsAcceptedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenInvitationIsAcceptedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenTastingIsCreatedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationRejectedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\TastingDeletedMessage;
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
