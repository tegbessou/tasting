<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Event\EyeAdded;
use App\Tasting\Domain\Event\EyeUpdated;
use App\Tasting\Domain\Event\NoseAdded;
use App\Tasting\Domain\Event\NoseUpdated;
use App\Tasting\Domain\Event\SheetCreated;
use App\Tasting\Domain\Specification\EyeCanBeAdd;
use App\Tasting\Domain\Specification\EyeCanBeUpdate;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\NoseArome;
use App\Tasting\Domain\ValueObject\NoseId;
use App\Tasting\Domain\ValueObject\NoseImpression;
use App\Tasting\Domain\ValueObject\NoseIntensite;
use App\Tasting\Domain\ValueObject\NoseObservation;
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
        private ?Nose $nose = null,
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

    public function updateEye(
        EyeLimpidite $limpidite,
        EyeBrillance $brillance,
        EyeIntensiteCouleur $intensiteCouleur,
        EyeTeinte $teinte,
        EyeLarme $larme,
        EyeObservation $observation,
        WineType $wineType,
    ): void {
        $specification = new EyeCanBeUpdate();
        $specification->satisfiedBy($teinte, $wineType);

        if ($this->eye() === null) {
            throw new \LogicException('Eye shouldn\'t be null');
        }

        $this->eye()->update(
            $limpidite,
            $brillance,
            $intensiteCouleur,
            $teinte,
            $larme,
            $observation,
        );

        self::recordEvent(
            new EyeUpdated(
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

    public function addNose(
        NoseId $id,
        NoseImpression $impression,
        NoseIntensite $intensite,
        NoseArome $arome,
        NoseObservation $observation,
    ): void {
        $nose = new Nose(
            $id,
            $impression,
            $intensite,
            $arome,
            $observation,
        );

        $this->nose = $nose;

        self::recordEvent(
            new NoseAdded(
                $this->id->value(),
                $impression->value(),
                $intensite->value(),
                $arome->value(),
                $observation->value(),
            ),
        );
    }

    public function updateNose(
        NoseImpression $impression,
        NoseIntensite $intensite,
        NoseArome $arome,
        NoseObservation $observation,
    ): void {
        if ($this->nose() === null) {
            throw new \LogicException('Nose shouldn\'t be null');
        }

        $this->nose()->update(
            $impression,
            $intensite,
            $arome,
            $observation,
        );

        self::recordEvent(
            new NoseUpdated(
                $this->id->value(),
                $impression->value(),
                $intensite->value(),
                $arome->value(),
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

    public function eye(): ?Eye
    {
        return $this->eye;
    }

    public function nose(): ?Nose
    {
        return $this->nose;
    }
}
