<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\InvitationMustBePendingException;
use App\Tasting\Domain\Exception\InvitationMustNotBePendingException;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityDomainEventTrait;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityWithDomainEventInterface;

#[ORM\Entity]
class Tasting implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    /**
     * @param Collection<int, Invitation> $invitations
     */
    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private TastingId $id,
        // Bottle Name
        #[ORM\Embedded(columnPrefix: false)]
        private BottleName $bottleName,
        #[ORM\Embedded(columnPrefix: false)]
        private TastingParticipants $participants,
        #[ORM\ManyToOne(targetEntity: Participant::class)]
        #[ORM\JoinColumn(name: 'owner_id', referencedColumnName: 'id')]
        private Participant $owner,
        #[ORM\OneToMany(mappedBy: 'subject', targetEntity: Invitation::class, cascade: ['persist'])]
        private Collection $invitations = new ArrayCollection(),
    ) {
    }

    public static function create(
        TastingId $id,
        BottleName $bottleName,
        Participant $owner,
    ): self {
        $tasting = new self(
            $id,
            $bottleName,
            TastingParticipants::fromOwner($owner->id()),
            $owner,
        );

        self::recordEvent(
            new TastingCreated(
                $tasting->id->value(),
                $owner->id()->value(),
            )
        );

        return $tasting;
    }

    public function acceptInvitation(Invitation $invitation): void
    {
        if (!$invitation->status()->isPending()) {
            throw new InvitationMustBePendingException();
        }

        $invitation->accept();

        $this->participants = $this->participants->add(
            $invitation->target()->id(),
        );
    }

    public function rejectInvitation(Invitation $invitation): void
    {
        if (!$invitation->status()->isPending()) {
            throw new InvitationMustBePendingException();
        }

        $invitation->reject();
    }

    public function removeInvitation(Invitation $invitation): void
    {
        if ($invitation->status()->isPending()) {
            throw new InvitationMustNotBePendingException();
        }

        $index = $this->invitations->indexOf($invitation);

        if ($index === false || is_string($index)) {
            throw new InvitationDoesntExistException($invitation->id()->value());
        }

        $this->invitations->remove(
            $index,
        );
    }

    public function participantAlreadyInvited(Participant $participant): bool
    {
        return $this->invitations->exists(
            fn (int $key, Invitation $invitation) => $invitation->target()->id()->value() === $participant->id()->value(),
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

    public function owner(): Participant
    {
        return $this->owner;
    }

    /**
     * @return Collection<int, Invitation>
     */
    public function invitations(): Collection
    {
        return $this->invitations;
    }
}
