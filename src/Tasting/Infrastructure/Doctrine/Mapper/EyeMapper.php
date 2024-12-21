<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Eye;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeParticipant;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Infrastructure\Doctrine\Entity\Eye as EyeDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;

final readonly class EyeMapper
{
    public static function toDomain(EyeDoctrine $eye): Eye
    {
        return new Eye(
            EyeId::fromString($eye->id),
            EyeParticipant::fromString($eye->participant),
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
        TastingDoctrine $tastingDoctrine,
    ): EyeDoctrine {
        return new EyeDoctrine(
            $eye->id()->value(),
            $tastingDoctrine,
            $eye->participant()->value(),
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
