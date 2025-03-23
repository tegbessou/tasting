<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum Acide: string
{
    case NERVEUSE = 'nerveuse';
    case PEINTRE = 'peintre';
    case VITE = 'vite';
    case FRAICHE = 'fraîche';
    case MOLLE = 'molle';

    public static function values(): array
    {
        return [
            self::NERVEUSE->value,
            self::PEINTRE->value,
            self::VITE->value,
            self::FRAICHE->value,
            self::MOLLE->value,
        ];
    }
}
