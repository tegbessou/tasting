<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Sucre: string
{
    case SIRUPEUX = 'sirupeux';
    case LIQOREUX = 'liquoreux';
    case MOELLEUX = 'moelleux';
    case DOUX = 'doux';
    case SEC = 'sec';
}
