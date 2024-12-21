<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum IntensiteCouleur: string
{
    case PALE = 'pâle';
    case CLAIRE = 'claire';
    case SATANE = 'soutenue';
    case INTENSE = 'intense';

    public static function values(): array
    {
        return [
            self::PALE->value,
            self::CLAIRE->value,
            self::SATANE->value,
            self::INTENSE->value,
        ];
    }
}
