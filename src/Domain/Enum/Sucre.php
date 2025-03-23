<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum Sucre: string
{
    case SIRUPEUX = 'sirupeux';
    case LIQOREUX = 'liquoreux';
    case MOELLEUX = 'moelleux';
    case DOUX = 'doux';
    case SEC = 'sec';

    public static function values(): array
    {
        return [
            self::SIRUPEUX->value,
            self::LIQOREUX->value,
            self::MOELLEUX->value,
            self::DOUX->value,
            self::SEC->value,
        ];
    }
}
