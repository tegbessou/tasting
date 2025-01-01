<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Nose;
use App\Tasting\Domain\Enum\Arome;
use App\Tasting\Domain\Enum\Impression;
use App\Tasting\Domain\Enum\Intensite;
use App\Tasting\Domain\ValueObject\NoseArome;
use App\Tasting\Domain\ValueObject\NoseId;
use App\Tasting\Domain\ValueObject\NoseImpression;
use App\Tasting\Domain\ValueObject\NoseIntensite;
use App\Tasting\Domain\ValueObject\NoseObservation;
use App\Tasting\Infrastructure\Doctrine\Entity\Nose as NoseDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;

final readonly class NoseMapper
{
    public static function toDomain(NoseDoctrine $nose): Nose
    {
        return new Nose(
            NoseId::fromString($nose->id),
            NoseImpression::fromString($nose->impression->value),
            NoseIntensite::fromString($nose->intensite->value),
            NoseArome::fromString($nose->arome->value),
            NoseObservation::fromString($nose->observation),
        );
    }

    public static function toInfrastructurePersist(
        Nose $nose,
        SheetDoctrine $sheetDoctrine,
    ): NoseDoctrine {
        return new NoseDoctrine(
            $nose->id()->value(),
            $sheetDoctrine,
            Impression::from($nose->impression()->value()),
            Intensite::from($nose->intensite()->value()),
            Arome::from($nose->arome()->value()),
            $nose->observation()->value(),
        );
    }

    public static function toInfrastructureUpdate(
        Nose $nose,
        NoseDoctrine $noseDoctrine,
    ): NoseDoctrine {
        $noseDoctrine->impression = Impression::from($nose->impression()->value());
        $noseDoctrine->intensite = Intensite::from($nose->intensite()->value());
        $noseDoctrine->arome = Arome::from($nose->arome()->value());
        $noseDoctrine->observation = $nose->observation()->value();

        return $noseDoctrine;
    }
}
