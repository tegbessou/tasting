<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum Arome: string
{
    case FRUITE = 'fruité';
    case FLORALE = 'florale';
    case VEGETAL = 'végétal';
    case BOISEE = 'boisée';
    case EMPYREUMATIQUE = 'empyreumatique';
    case ANIMALE = 'animale';
    case BALSAMIQUE = 'balsamique';
    case MINERALES = 'minérales';

    public static function values(): array
    {
        return [
            self::FRUITE->value,
            self::FLORALE->value,
            self::VEGETAL->value,
            self::BOISEE->value,
            self::EMPYREUMATIQUE->value,
            self::ANIMALE->value,
            self::BALSAMIQUE->value,
            self::MINERALES->value,
        ];
    }
}
