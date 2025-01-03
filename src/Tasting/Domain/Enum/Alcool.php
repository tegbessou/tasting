<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Alcool: string
{
    case ALCOOLEUX = 'alcooleux';
    case CAPITEUX = 'capiteux';
    case GRAS = 'gras';
    case GENEREUX = 'généreux';
    case FAIBLE = 'faible';

    public static function values(): array
    {
        return [
            self::ALCOOLEUX->value,
            self::CAPITEUX->value,
            self::FAIBLE->value,
            self::GENEREUX->value,
            self::GRAS->value,
        ];
    }
}
