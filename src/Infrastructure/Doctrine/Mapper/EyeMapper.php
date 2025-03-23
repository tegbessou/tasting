<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Mapper;

use EmpireDesAmis\Tasting\Domain\Entity\Eye;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeBrillance;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeId;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLarme;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLimpidite;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeTeinte;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Eye as EyeDoctrine;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;

final readonly class EyeMapper
{
    public static function toDomain(EyeDoctrine $eye): Eye
    {
        return new Eye(
            EyeId::fromString($eye->id),
            EyeLimpidite::fromString($eye->limpidite->value),
            EyeBrillance::fromString($eye->brillance->value),
            EyeIntensiteCouleur::fromString($eye->intensiteCouleur->value),
            EyeTeinte::fromString($eye->teinte),
            EyeLarme::fromString($eye->larme->value),
            EyeObservation::fromString($eye->observation),
        );
    }

    public static function toInfrastructurePersist(
        Eye $eye,
        SheetDoctrine $sheetDoctrine,
    ): EyeDoctrine {
        return new EyeDoctrine(
            $eye->id()->value(),
            $sheetDoctrine,
            Limpidite::from($eye->limpidite()->value()),
            Brillance::from($eye->brillance()->value()),
            IntensiteCouleur::from($eye->intensiteCouleur()->value()),
            $eye->teinte()->value(),
            Larme::from($eye->larme()->value()),
            $eye->observation()->value(),
        );
    }

    public static function toInfrastructureUpdate(
        Eye $eye,
        EyeDoctrine $eyeDoctrine,
    ): EyeDoctrine {
        $eyeDoctrine->limpidite = Limpidite::from($eye->limpidite()->value());
        $eyeDoctrine->brillance = Brillance::from($eye->brillance()->value());
        $eyeDoctrine->intensiteCouleur = IntensiteCouleur::from($eye->intensiteCouleur()->value());
        $eyeDoctrine->teinte = $eye->teinte()->value();
        $eyeDoctrine->larme = Larme::from($eye->larme()->value());
        $eyeDoctrine->observation = $eye->observation()->value();

        return $eyeDoctrine;
    }
}
