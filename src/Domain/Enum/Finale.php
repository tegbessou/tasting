<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum Finale: string
{
    case REMANENTE = 'rémanente';
    case PERSISTANTE = 'persistante';
    case LANGUE = 'langue';
    case DEVELOPPEE = 'développée';
    case COURTE = 'courte';

    public static function values(): array
    {
        return [
            self::REMANENTE->value,
            self::PERSISTANTE->value,
            self::LANGUE->value,
            self::DEVELOPPEE->value,
            self::COURTE->value,
        ];
    }
}
