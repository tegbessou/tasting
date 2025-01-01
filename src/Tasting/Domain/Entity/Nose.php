<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\ValueObject\NoseArome;
use App\Tasting\Domain\ValueObject\NoseId;
use App\Tasting\Domain\ValueObject\NoseImpression;
use App\Tasting\Domain\ValueObject\NoseIntensite;
use App\Tasting\Domain\ValueObject\NoseObservation;

final class Nose
{
    public function __construct(
        private readonly NoseId $id,
        private NoseImpression $impression,
        private NoseIntensite $intensite,
        private NoseArome $arome,
        private NoseObservation $observation,
    ) {
    }

    public static function create(
        NoseId $id,
        NoseImpression $impression,
        NoseIntensite $intensite,
        NoseArome $arome,
        NoseObservation $observation,
    ): self {
        return new self(
            $id,
            $impression,
            $intensite,
            $arome,
            $observation,
        );
    }

    public function update(
        NoseImpression $impression,
        NoseIntensite $intensite,
        NoseArome $arome,
        NoseObservation $observation,
    ): void {
        $this->impression = $impression;
        $this->intensite = $intensite;
        $this->arome = $arome;
        $this->observation = $observation;
    }

    public function id(): NoseId
    {
        return $this->id;
    }

    public function impression(): NoseImpression
    {
        return $this->impression;
    }

    public function intensite(): NoseIntensite
    {
        return $this->intensite;
    }

    public function arome(): NoseArome
    {
        return $this->arome;
    }

    public function observation(): NoseObservation
    {
        return $this->observation;
    }
}
