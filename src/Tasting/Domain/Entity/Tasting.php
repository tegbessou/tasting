<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Domain\Event\TastingCreatedEvent;
use App\Tasting\Domain\Event\TastingParticipantsInvitedEvent;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Tasting implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

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
                $tasting->id->id(),
                $owner->id()->id(),
            )
        );

        return $tasting;
    }

    public function inviteParticipants(
        array $participants,
    ): void {
        Assert::allIsInstanceOf($participants, Participant::class);

        $participantsUuid = [];

        /** @var Participant $participant */
        foreach ($participants as $participant) {
            if (in_array($participant->id()->id(), $this->participants->values())) {
                continue;
            }

            $participantsUuid[] = $participant->id()->id();
        }

        $this->participants = $this->participants()->add(
            $participantsUuid
        );

        self::recordEvent(
            new TastingParticipantsInvitedEvent(
                $this->id->id(),
                $this->participants->values(),
                $this->owner->id()->id(),
            )
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
}
