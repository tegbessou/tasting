<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum WineType: string
{
    case RedWine = 'red';
    case WhiteWine = 'white';
    case RoseWine = 'rosé';
    case OrangeWine = 'orange';
    case ChampagneWine = 'champagne';
    case SparklingWine = 'sparkling';

    public function getTeintes(): array
    {
        return match ($this) {
            self::RedWine => [
                RedTeinte::AMBRE->value,
                RedTeinte::CERISE->value,
                RedTeinte::GRENAT->value,
                RedTeinte::POURPRE->value,
                RedTeinte::TUILE->value,
            ],
            self::WhiteWine => [
                WhiteTeinte::PAILLE->value,
                WhiteTeinte::BLANC->value,
                WhiteTeinte::DORE->value,
                WhiteTeinte::ROUX->value,
                WhiteTeinte::VERT->value,
            ],
            self::RoseWine => [
                RoseTeinte::VIEUX_ROSE->value,
                RoseTeinte::FRAMBOISE->value,
                RoseTeinte::SAUMON->value,
                RoseTeinte::PIVOINE->value,
                RoseTeinte::PELURE_D_OIGNON->value,
            ],
            self::OrangeWine => [
                OrangeTeinte::AMBRE->value,
                OrangeTeinte::CUIVRE->value,
                OrangeTeinte::INTENSE_ORANGE->value,
                OrangeTeinte::JAUNE_DORE->value,
            ],
            self::ChampagneWine => [
                ChampagneTeinte::PALE_YELLOW->value,
                ChampagneTeinte::GOLDEN->value,
                ChampagneTeinte::INTENSE_YELLOW->value,
                ChampagneTeinte::ROSE_GOLD->value,
            ],
            self::SparklingWine => [
                SparklingTeinte::BRILLANT_WHITE->value,
                SparklingTeinte::ROSE->value,
                SparklingTeinte::DEEP_YELLOW->value,
                SparklingTeinte::GOLDEN->value,
                SparklingTeinte::PALE_YELLOW->value,
            ],
        };
    }

    public function isSweetWine(): bool
    {
        return $this === WineType::WhiteWine
            || $this === WineType::RoseWine
            || $this === WineType::SparklingWine
        ;
    }
}
