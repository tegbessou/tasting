<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Mapper;

use EmpireDesAmis\Tasting\Domain\Entity\Nose;
use EmpireDesAmis\Tasting\Domain\Enum\Arome;
use EmpireDesAmis\Tasting\Domain\Enum\Impression;
use EmpireDesAmis\Tasting\Domain\Enum\Intensite;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseArome;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseId;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseImpression;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseIntensite;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseObservation;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Nose as NoseDoctrine;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;

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
