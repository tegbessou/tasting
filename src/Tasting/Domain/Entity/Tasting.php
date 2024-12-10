<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationDeleted;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\InvitationSent;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Event\TastingParticipantInvited;
use App\Tasting\Domain\Exception\InvitationAlreadySentException;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\InvitationMustBePendingException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingAcceptedException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingRejectedException;
use App\Tasting\Domain\Exception\InvitationMustNotBePendingException;
use App\Tasting\Domain\Service\GetInvitationLink;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingInvitations;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityDomainEventTrait;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityWithDomainEventInterface;

final class Tasting implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    public function __construct(
        private readonly TastingId $id,
        private readonly BottleName $bottleName,
        private TastingParticipants $participants,
        private readonly TastingOwnerId $ownerId,
        private TastingInvitations $invitations,
    ) {
    }

    public static function create(
        TastingId $id,
        BottleName $bottleName,
        TastingOwnerId $ownerId,
    ): self {
        $tasting = new self(
            $id,
            $bottleName,
            TastingParticipants::fromOwner($ownerId),
            $ownerId,
            TastingInvitations::empty(),
        );

        self::recordEvent(
            new TastingCreated(
                $tasting->id->value(),
                $bottleName->value(),
                $ownerId->value(),
                $tasting->participants()->values(),
            )
        );

        return $tasting;
    }

    public function invite(
        InvitationId $invitationId,
        InvitationTarget $invitationTarget,
    ): void {
        $invitation = Invitation::create(
            $invitationId,
            $invitationTarget,
            GetInvitationLink::getLink(),
        );

        $this->invitations = TastingInvitations::fromArray(
            array_merge(
                $this->invitations->values(),
                [$invitation],
            )
        );

        self::recordEvent(
            new TastingParticipantInvited(
                $invitationId->value(),
                $this->id()->value(),
                $this->bottleName()->value(),
                $this->ownerId()->value(),
                $invitationTarget->value(),
                $invitation->link()->value(),
                $invitation->createdAt()->value(),
            ),
        );
    }

    public function sendInvitation(Invitation $invitation): void
    {
        if ($invitation->isAlreadySent()) {
            throw new InvitationAlreadySentException();
        }

        $invitation->send();

        self::recordEvent(
            new InvitationSent(
                $invitation->id()->value(),
                $invitation->sentAt()?->value() ?? throw new \InvalidArgumentException(),
            ),
        );
    }

    public function acceptInvitation(Invitation $invitation): void
    {
        if (!$invitation->status()->isPending()) {
            throw new InvitationMustBePendingException();
        }

        if (!$invitation->isAlreadySent()) {
            throw new InvitationMustBeSentBeforeBeingAcceptedException();
        }

        $invitation->changeStatus(InvitationStatus::fromString('accepted'));

        self::recordEvent(
            new InvitationAccepted(
                $this->id->value(),
                $invitation->id()->value(),
            ),
        );

        $this->participants = $this->participants->add(
            ParticipantId::fromString($invitation->target()->value()),
        );
    }

    public function rejectInvitation(Invitation $invitation): void
    {
        if (!$invitation->status()->isPending()) {
            throw new InvitationMustBePendingException();
        }

        if (!$invitation->isAlreadySent()) {
            throw new InvitationMustBeSentBeforeBeingRejectedException();
        }

        $invitation->changeStatus(InvitationStatus::fromString('rejected'));

        self::recordEvent(
            new InvitationRejected(
                $this->id->value(),
                $invitation->id()->value(),
            ),
        );
    }

    public function deleteInvitation(Invitation $invitation): void
    {
        if ($invitation->status()->isPending()) {
            throw new InvitationMustNotBePendingException();
        }

        $index = $this->invitations->indexOf($invitation);

        if ($index === false) {
            throw new InvitationDoesntExistException($invitation->id()->value());
        }

        $oldInvitations = $this->invitations->values();
        unset($oldInvitations[$index]);

        $this->invitations = TastingInvitations::fromArray(
            array_values($oldInvitations),
        );

        self::recordEvent(
            new InvitationDeleted(
                $this->id->value(),
                $invitation->id()->value(),
            ),
        );
    }

    public function participantAlreadyInvited(string $participantId): bool
    {
        return $this->invitations->isAlreadyInvited(
            ParticipantId::fromString($participantId),
        );
    }

    public function id(): TastingId
    {
        return $this->id;
    }

    public function bottleName(): BottleName
    {
        return $this->bottleName;
    }

    public function participants(): TastingParticipants
    {
        return $this->participants;
    }

    public function ownerId(): TastingOwnerId
    {
        return $this->ownerId;
    }

    public function invitations(): TastingInvitations
    {
        return $this->invitations;
    }
}
