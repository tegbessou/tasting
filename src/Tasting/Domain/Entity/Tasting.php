<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use App\Tasting\Domain\Event\TastingCreatedEvent;
use App\Tasting\Domain\Exception\InvitationMustBePendingException;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

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
        #[ORM\Embedded(columnPrefix: false)]
        private BottleId $bottleId,
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
        BottleId $bottleId,
        Participant $owner,
    ): self {
        $tasting = new self(
            $id,
            $bottleId,
            TastingParticipants::fromOwner($owner->id()),
            $owner,
        );

        self::recordEvent(
            new TastingCreatedEvent(
                $tasting->id->value(),
                $owner->id()->value(),
            )
        );

        return $tasting;
    }

    // Il reste l'endpoint à faire et l'evenement à écouter pour dispatch un message qui supprimera une invitation
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

    public function bottleId(): BottleId
    {
        return $this->bottleId;
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
