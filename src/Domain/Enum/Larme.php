<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum Larme: string
{
    case VISQUEUSE = 'visqueuse';
    case GRASSE = 'grasse';
    case EPAISSE = 'épaisse';
    case ROULANTE = 'roulante';
    case FLUIDE = 'fluide';

    public static function values(): array
    {
        return [
            self::VISQUEUSE->value,
            self::GRASSE->value,
            self::EPAISSE->value,
            self::ROULANTE->value,
            self::FLUIDE->value,
        ];
    }
}
