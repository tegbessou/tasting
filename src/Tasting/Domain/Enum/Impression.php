<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Impression: string
{
    case COMPLEXE = 'complexe';
    case FRANC = 'franc';
    case SIMPLE = 'simple';
    case DOUTEUX = 'douteux';
    case DEFAUTS = 'défauts';

    public static function values(): array
    {
        return [
            self::COMPLEXE->value,
            self::FRANC->value,
            self::SIMPLE->value,
            self::DOUTEUX->value,
            self::DEFAUTS->value,
        ];
    }
}
