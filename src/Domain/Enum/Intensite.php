<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum Intensite: string
{
    case INTIME = 'intime';
    case OUVERT = 'ouvert';
    case AROMATIQUE = 'aromatique';
    case DISCRET_FERME = 'discret fermé';

    public static function values(): array
    {
        return [
            self::INTIME->value,
            self::OUVERT->value,
            self::AROMATIQUE->value,
            self::DISCRET_FERME->value,
        ];
    }
}
