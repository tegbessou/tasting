<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Tanin: string
{
    case APRE = 'âpre';
    case CHARGE = 'chargé';
    case CHARPENTE = 'charpenté';
    case FADE = 'fade';
    case LISSE = 'lisse';

    public static function values(): array
    {
        return [
            self::APRE->value,
            self::CHARGE->value,
            self::CHARPENTE->value,
            self::FADE->value,
            self::LISSE->value,
        ];
    }
}
