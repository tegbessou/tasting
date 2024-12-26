<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Event\EyeAdded;
use App\Tasting\Domain\Event\SheetCreated;
use App\Tasting\Domain\Specification\EyeCanBeAdd;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityDomainEventTrait;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityWithDomainEventInterface;

final class Sheet implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    public function __construct(
        private readonly SheetId $id,
        private readonly SheetTastingId $tastingId,
        private readonly SheetParticipant $participantId,
        private ?Eye $eye = null,
    ) {
    }

    public static function create(
        SheetId $id,
        SheetTastingId $tastingId,
        SheetParticipant $participantId,
    ): self {
        $sheet = new self(
            $id,
            $tastingId,
            $participantId,
        );

        self::recordEvent(
            new SheetCreated(
                $sheet->id->value(),
                $sheet->tastingId->value(),
                $sheet->participantId->value(),
            ),
        );

        return $sheet;
    }

    public function addEye(
        EyeId $id,
        EyeLimpidite $limpidite,
        EyeBrillance $brillance,
        EyeIntensiteCouleur $intensiteCouleur,
        EyeTeinte $teinte,
        EyeLarme $larme,
        EyeObservation $observation,
        WineType $wineType,
    ): void {
        $eye = new Eye(
            $id,
            $limpidite,
            $brillance,
            $intensiteCouleur,
            $teinte,
            $larme,
            $observation,
        );

        $specification = new EyeCanBeAdd();
        $specification->satisfiedBy($eye, $wineType);

        $this->eye = $eye;

        self::recordEvent(
            new EyeAdded(
                $this->id->value(),
                $limpidite->value(),
                $brillance->value(),
                $intensiteCouleur->value(),
                $teinte->value(),
                $larme->value(),
                $observation->value(),
            ),
        );
    }

    public function id(): SheetId
    {
        return $this->id;
    }

    public function tastingId(): SheetTastingId
    {
        return $this->tastingId;
    }

    public function participant(): SheetParticipant
    {
        return $this->participantId;
    }

    public function eye(): Eye
    {
        if ($this->eye === null) {
            throw new \RuntimeException('Eye not found');
        }

        return $this->eye;
    }
}
