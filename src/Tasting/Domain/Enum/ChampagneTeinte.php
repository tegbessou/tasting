<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum ChampagneTeinte: string
{
    case PALE_YELLOW = 'Jaune pâle';
    case GOLDEN = 'Doré';
    case ROSE_GOLD = 'Or rose';
    case INTENSE_YELLOW = 'Jaune intense';
}
