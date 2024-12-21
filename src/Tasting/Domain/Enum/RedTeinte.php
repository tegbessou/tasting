<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum RedTeinte: string
{
    case POURPRE = 'pourpre';
    case CERISE = 'cerise';
    case GRENAT = 'grenat';
    case TUILE = 'tuile';
    case AMBRE = 'ambre';
}
