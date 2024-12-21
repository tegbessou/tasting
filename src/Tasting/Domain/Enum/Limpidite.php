<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Limpidite: string
{
    case LIMPIDE = 'limpide';
    case OPALESCENTE = 'opalescente';
    case VOILEE = 'voilée';
    case FLOUE = 'floue';
    case TROUBLE = 'trouble';

    public static function values(): array
    {
        return [
            self::LIMPIDE->value,
            self::OPALESCENTE->value,
            self::VOILEE->value,
            self::FLOUE->value,
            self::TROUBLE->value,
        ];
    }
}
