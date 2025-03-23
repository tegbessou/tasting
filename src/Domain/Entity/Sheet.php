<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Entity;

use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Event\EyeAdded;
use EmpireDesAmis\Tasting\Domain\Event\EyeUpdated;
use EmpireDesAmis\Tasting\Domain\Event\MouthAdded;
use EmpireDesAmis\Tasting\Domain\Event\MouthUpdated;
use EmpireDesAmis\Tasting\Domain\Event\NoseAdded;
use EmpireDesAmis\Tasting\Domain\Event\NoseUpdated;
use EmpireDesAmis\Tasting\Domain\Event\SheetCreated;
use EmpireDesAmis\Tasting\Domain\Event\SheetDeleted;
use EmpireDesAmis\Tasting\Domain\Specification\EyeCanBeAdd;
use EmpireDesAmis\Tasting\Domain\Specification\EyeCanBeUpdate;
use EmpireDesAmis\Tasting\Domain\Specification\MouthCanBeAdd;
use EmpireDesAmis\Tasting\Domain\Specification\MouthCanBeUpdate;
use EmpireDesAmis\Tasting\Domain\Specification\NoseCanBeAdd;
use EmpireDesAmis\Tasting\Domain\Specification\NoseCanBeUpdate;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeBrillance;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeId;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLarme;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLimpidite;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeTeinte;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAcide;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAlcool;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthFinale;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthId;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthMatiere;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthSucre;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthTanin;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseArome;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseId;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseImpression;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseIntensite;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;
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
        private ?Mouth $mouth = null,
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
        $eye = Eye::create(
            $id,
            $limpidite,
            $brillance,
            $intensiteCouleur,
            $teinte,
            $larme,
            $observation,
        );

        $specification = new EyeCanBeAdd($this);
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
        $specification = new EyeCanBeUpdate($this);
        $specification->satisfiedBy($teinte, $wineType);

        $this->eye()?->update(
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
        $nose = Nose::create(
            $id,
            $impression,
            $intensite,
            $arome,
            $observation,
        );

        $specification = new NoseCanBeAdd($this);
        $specification->satisfiedBy();

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
        $specification = new NoseCanBeUpdate($this);
        $specification->satisfiedBy();

        $this->nose()?->update(
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

    public function addMouth(
        MouthId $id,
        MouthAlcool $alcool,
        MouthAcide $acide,
        MouthMatiere $matiere,
        MouthFinale $finale,
        MouthObservation $observation,
        WineType $wineType,
        ?MouthTanin $tanin = null,
        ?MouthSucre $sucre = null,
    ): void {
        $mouth = Mouth::create(
            $id,
            $alcool,
            $acide,
            $matiere,
            $finale,
            $observation,
            $tanin,
            $sucre,
        );

        $specification = new MouthCanBeAdd($this);
        $specification->satisfiedBy($mouth, $wineType);

        $this->mouth = $mouth;

        self::recordEvent(
            new MouthAdded(
                $this->id->value(),
                $alcool->value(),
                $acide->value(),
                $matiere->value(),
                $finale->value(),
                $observation->value(),
                $tanin?->value() ?? null,
                $sucre?->value() ?? null,
            ),
        );
    }

    public function updateMouth(
        MouthAlcool $alcool,
        MouthAcide $acide,
        MouthMatiere $matiere,
        MouthFinale $finale,
        MouthObservation $observation,
        WineType $wineType,
        ?MouthTanin $tanin = null,
        ?MouthSucre $sucre = null,
    ): void {
        $specification = new MouthCanBeUpdate($this);
        $specification->satisfiedBy(
            $wineType,
            $tanin,
            $sucre,
        );

        $this->mouth()?->update(
            $alcool,
            $acide,
            $matiere,
            $finale,
            $observation,
            $tanin ?? null,
            $sucre ?? null,
        );

        self::recordEvent(
            new MouthUpdated(
                $this->id->value(),
                $alcool->value(),
                $acide->value(),
                $matiere->value(),
                $finale->value(),
                $observation->value(),
                $tanin?->value() ?? null,
                $sucre?->value() ?? null,
            ),
        );
    }

    public function delete(): void
    {
        self::recordEvent(
            new SheetDeleted(
                $this->id()->value(),
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

    public function mouth(): ?Mouth
    {
        return $this->mouth;
    }
}
