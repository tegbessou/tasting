<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Mouth;
use App\Tasting\Domain\Enum\Acide;
use App\Tasting\Domain\Enum\Alcool;
use App\Tasting\Domain\Enum\Finale;
use App\Tasting\Domain\Enum\Matiere;
use App\Tasting\Domain\Enum\Sucre;
use App\Tasting\Domain\Enum\Tanin;
use App\Tasting\Domain\ValueObject\MouthAcide;
use App\Tasting\Domain\ValueObject\MouthAlcool;
use App\Tasting\Domain\ValueObject\MouthFinale;
use App\Tasting\Domain\ValueObject\MouthId;
use App\Tasting\Domain\ValueObject\MouthMatiere;
use App\Tasting\Domain\ValueObject\MouthObservation;
use App\Tasting\Domain\ValueObject\MouthSucre;
use App\Tasting\Domain\ValueObject\MouthTanin;
use App\Tasting\Infrastructure\Doctrine\Entity\Mouth as MouthDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;

final readonly class MouthMapper
{
    public static function toDomain(MouthDoctrine $mouth): Mouth
    {
        return new Mouth(
            MouthId::fromString($mouth->id),
            MouthAlcool::fromString($mouth->alcool->value),
            MouthAcide::fromString($mouth->acide->value),
            MouthMatiere::fromString($mouth->matiere->value),
            MouthFinale::fromString($mouth->finale->value),
            MouthObservation::fromString($mouth->observation),
            $mouth->tanin !== null ? MouthTanin::fromString(
                $mouth->tanin->value,
            ) : null,
            $mouth->sucre !== null ? MouthSucre::fromString(
                $mouth->sucre->value,
            ) : null,
        );
    }

    public static function toInfrastructurePersist(
        Mouth $mouth,
        SheetDoctrine $sheetDoctrine,
    ): MouthDoctrine {
        return new MouthDoctrine(
            $mouth->id()->value(),
            $sheetDoctrine,
            Alcool::from($mouth->alcool()->value()),
            Acide::from($mouth->acide()->value()),
            Matiere::from($mouth->matiere()->value()),
            Finale::from($mouth->finale()->value()),
            $mouth->observation()->value(),
            $mouth->tanin() !== null ? Tanin::from(
                $mouth->tanin()->value(),
            ) : null,
            $mouth->sucre() !== null ? Sucre::from(
                $mouth->sucre()->value(),
            ) : null,
        );
    }

    public static function toInfrastructureUpdate(
        Mouth $mouth,
        MouthDoctrine $mouthDoctrine,
    ): MouthDoctrine {
        $mouthDoctrine->alcool = Alcool::from($mouth->alcool()->value());
        $mouthDoctrine->acide = Acide::from($mouth->acide()->value());
        $mouthDoctrine->matiere = Matiere::from($mouth->matiere()->value());
        $mouthDoctrine->finale = Finale::from($mouth->finale()->value());
        $mouthDoctrine->observation = $mouth->observation()->value();
        $mouthDoctrine->tanin = $mouth->tanin() !== null ? Tanin::from(
            $mouth->tanin()->value(),
        ) : null;
        $mouthDoctrine->sucre = $mouth->sucre() !== null ? Sucre::from(
            $mouth->sucre()->value(),
        ) : null;

        return $mouthDoctrine;
    }
}
