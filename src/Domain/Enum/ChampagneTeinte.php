<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum ChampagneTeinte: string
{
    case PALE_YELLOW = 'jaune pâle';
    case GOLDEN = 'doré';
    case ROSE_GOLD = 'or rose';
    case INTENSE_YELLOW = 'jaune intense';
}
