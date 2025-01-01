<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Finale: string
{
    case REMANENTE = 'rémanente';
    case PERSISTANTE = 'persistante';
    case LANGUE = 'langue';
    case DEVELOPPEE = 'développée';
    case COURTE = 'courte';
}
