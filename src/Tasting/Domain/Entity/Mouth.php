<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\ValueObject\MouthAcide;
use App\Tasting\Domain\ValueObject\MouthAlcool;
use App\Tasting\Domain\ValueObject\MouthFinale;
use App\Tasting\Domain\ValueObject\MouthId;
use App\Tasting\Domain\ValueObject\MouthMatiere;
use App\Tasting\Domain\ValueObject\MouthObservation;
use App\Tasting\Domain\ValueObject\MouthSucre;
use App\Tasting\Domain\ValueObject\MouthTanin;

final class Mouth
{
    public function __construct(
        private readonly MouthId $id,
        private MouthAlcool $alcool,
        private MouthAcide $acide,
        private MouthMatiere $matiere,
        private MouthFinale $finale,
        private MouthObservation $observation,
        private ?MouthTanin $tanin = null,
        private ?MouthSucre $sucre = null,
    ) {
    }

    public static function create(
        MouthId $id,
        MouthAlcool $alcool,
        MouthAcide $acide,
        MouthMatiere $matiere,
        MouthFinale $finale,
        MouthObservation $observation,
        ?MouthTanin $tanin = null,
        ?MouthSucre $sucre = null,
    ): self {
        return new self(
            $id,
            $alcool,
            $acide,
            $matiere,
            $finale,
            $observation,
            $tanin,
            $sucre,
        );
    }

    public function update(
        MouthAlcool $alcool,
        MouthAcide $acide,
        MouthMatiere $matiere,
        MouthFinale $finale,
        MouthObservation $observation,
        ?MouthTanin $tanin = null,
        ?MouthSucre $sucre = null,
    ): void {
        $this->alcool = $alcool;
        $this->acide = $acide;
        $this->matiere = $matiere;
        $this->finale = $finale;
        $this->observation = $observation;
        $this->tanin = $tanin;
        $this->sucre = $sucre;
    }

    public function id(): MouthId
    {
        return $this->id;
    }

    public function alcool(): MouthAlcool
    {
        return $this->alcool;
    }

    public function acide(): MouthAcide
    {
        return $this->acide;
    }

    public function matiere(): MouthMatiere
    {
        return $this->matiere;
    }

    public function finale(): MouthFinale
    {
        return $this->finale;
    }

    public function observation(): MouthObservation
    {
        return $this->observation;
    }

    public function tanin(): ?MouthTanin
    {
        return $this->tanin;
    }

    public function sucre(): ?MouthSucre
    {
        return $this->sucre;
    }
}
