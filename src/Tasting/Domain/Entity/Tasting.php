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
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final class Tasting implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private TastingId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleId $bottleId,
        #[ORM\Embedded(columnPrefix: false)]
        private TastingParticipants $participants,
        #[ORM\Embedded(columnPrefix: false)]
        private TastingOwnerId $ownerId,
    ) {
    }

    // reflechir s'il faut mieux utiliser un value object participant pour pouvoir les typer en owner
    // ou s'il vaut mieux rajouter un champs owner dans la dégustation
    // si on utilise un participant alors => quand un user est créé alors on crée un participant dans ce bounded context

    public static function create(
        TastingId $id,
        // rajouter le fait de vérifier que ça existe
        BottleId $bottleId,
        // rajouter le fait de vérifier que ça existe
        TastingOwnerId $ownerId,
    ): self {
        $tasting = new self(
            $id,
            $bottleId,
            TastingParticipants::fromOwner($ownerId),
            $ownerId,
        );

        self::recordEvent(
            new TastingCreatedEvent(
                $tasting->id->value(),
                $tasting->ownerId->id(),
            )
        );

        return $tasting;
    }

    public function inviteParticipants(
        array $participants,
    ): void {
        Assert::allUuid($participants);
        Assert::allMinLength($participants, 36);
        Assert::allMaxLength($participants, 36);

        $this->participants = $this->participants()->add($participants);

        self::recordEvent(
            new TastingParticipantsInvitedEvent(
                $this->id->value(),
                $this->participants->values(),
                $this->ownerId->id(),
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
}
