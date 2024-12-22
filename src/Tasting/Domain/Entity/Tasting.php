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
use App\Tasting\Domain\Specification\EyeCanBeAdd;
use App\Tasting\Domain\Specification\ParticipantCanBeInvite;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeParticipant;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingEyes;
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
        private TastingEyes $eyes,
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
            TastingEyes::empty(),
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

    public function addEye(
        EyeId $id,
        EyeParticipant $participant,
        EyeLimpidite $limpidite,
        EyeBrillance $brillance,
        EyeIntensiteCouleur $intensiteCouleur,
        EyeTeinte $teinte,
        EyeLarme $larme,
        EyeObservation $observation,
    ): void {
        $eye = new Eye(
            $id,
            $participant,
            $limpidite,
            $brillance,
            $intensiteCouleur,
            $teinte,
            $larme,
            $observation,
        );

        $specification = new EyeCanBeAdd($this);
        $specification->satisfiedBy($eye);

        $this->eyes = $this->eyes->add($eye);
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

    public function eyes(): TastingEyes
    {
        return $this->eyes;
    }
}
