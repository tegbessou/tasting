<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Matiere: string
{
    case MASSIVE = 'massive';
    case CORPULANTE = 'corpulante';
    case ETOFFEE = 'étoffée';
    case LEGERE = 'légère';
    case FLUETTE = 'fluette';
}
