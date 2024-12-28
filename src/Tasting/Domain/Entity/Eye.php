<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeTeinte;

final class Eye
{
    public function __construct(
        private readonly EyeId $id,
        private EyeLimpidite $limpidite,
        private EyeBrillance $brillance,
        private EyeIntensiteCouleur $intensiteCouleur,
        private EyeTeinte $teinte,
        private EyeLarme $larme,
        private EyeObservation $observation,
    ) {
    }

    public static function create(
        EyeId $id,
        EyeLimpidite $limpidite,
        EyeBrillance $brillance,
        EyeIntensiteCouleur $intensiteCouleur,
        EyeTeinte $teinte,
        EyeLarme $larme,
        EyeObservation $observation,
    ): self {
        return new self(
            $id,
            $limpidite,
            $brillance,
            $intensiteCouleur,
            $teinte,
            $larme,
            $observation,
        );
    }

    public function update(
        EyeLimpidite $limpidite,
        EyeBrillance $brillance,
        EyeIntensiteCouleur $intensiteCouleur,
        EyeTeinte $teinte,
        EyeLarme $larme,
        EyeObservation $observation,
    ): void {
        $this->limpidite = $limpidite;
        $this->brillance = $brillance;
        $this->intensiteCouleur = $intensiteCouleur;
        $this->teinte = $teinte;
        $this->larme = $larme;
        $this->observation = $observation;
    }

    public function id(): EyeId
    {
        return $this->id;
    }

    public function limpidite(): EyeLimpidite
    {
        return $this->limpidite;
    }

    public function brillance(): EyeBrillance
    {
        return $this->brillance;
    }

    public function intensiteCouleur(): EyeIntensiteCouleur
    {
        return $this->intensiteCouleur;
    }

    public function teinte(): EyeTeinte
    {
        return $this->teinte;
    }

    public function larme(): EyeLarme
    {
        return $this->larme;
    }

    public function observation(): EyeObservation
    {
        return $this->observation;
    }
}
