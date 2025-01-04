<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationDeleted;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\InvitationSent;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Event\TastingDeleted;
use App\Tasting\Domain\Event\TastingParticipantInvited;
use App\Tasting\Domain\Service\GetInvitationLink;
use App\Tasting\Domain\Specification\InvitationCanBeAccept;
use App\Tasting\Domain\Specification\InvitationCanBeDelete;
use App\Tasting\Domain\Specification\InvitationCanBeReject;
use App\Tasting\Domain\Specification\InvitationCanBeSend;
use App\Tasting\Domain\Specification\ParticipantCanBeInvite;
use App\Tasting\Domain\ValueObject\Bottle;
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
        private readonly Bottle $bottle,
        private TastingParticipants $participants,
        private readonly TastingOwnerId $ownerId,
        private TastingInvitations $invitations,
    ) {
    }

    public static function create(
        TastingId $id,
        Bottle $bottle,
        TastingOwnerId $ownerId,
    ): self {
        $tasting = new self(
            $id,
            $bottle,
            TastingParticipants::fromOwner($ownerId),
            $ownerId,
            TastingInvitations::empty(),
        );

        self::recordEvent(
            new TastingCreated(
                $tasting->id->value(),
                $bottle->name(),
                $bottle->wineType()->value,
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

        $specification = new ParticipantCanBeInvite($this);
        $specification->satisfiedBy($invitation);

        $this->invitations = $this->invitations->add($invitation);

        self::recordEvent(
            new TastingParticipantInvited(
                $invitationId->value(),
                $this->id()->value(),
                $this->bottle()->name(),
                $this->ownerId()->value(),
                $invitationTarget->value(),
                $invitation->link()->value(),
                $invitation->createdAt()->value(),
            ),
        );
    }

    public function sendInvitation(Invitation $invitation): void
    {
        $specification = new InvitationCanBeSend();
        $specification->satisfiedBy($invitation);

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
        $specification = new InvitationCanBeAccept();
        $specification->satisfiedBy($invitation);

        $invitation->changeStatus(InvitationStatus::fromString('accepted'));

        self::recordEvent(
            new InvitationAccepted(
                $this->id->value(),
                $invitation->id()->value(),
                $invitation->target()->value(),
            ),
        );

        $this->participants = $this->participants->add(
            ParticipantId::fromString($invitation->target()->value()),
        );
    }

    public function rejectInvitation(Invitation $invitation): void
    {
        $specification = new InvitationCanBeReject();
        $specification->satisfiedBy($invitation);

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
        $specification = new InvitationCanBeDelete();
        $specification->satisfiedBy($invitation);

        $this->invitations = $this->invitations->delete($invitation);

        self::recordEvent(
            new InvitationDeleted(
                $this->id->value(),
                $invitation->id()->value(),
            ),
        );
    }

    public function delete(): void
    {
        self::recordEvent(
            new TastingDeleted(
                $this->id->value(),
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

    public function bottle(): Bottle
    {
        return $this->bottle;
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
