<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum RoseTeinte: string
{
    case PIVOINE = 'pivoine';
    case FRAMBOISE = 'framboise';
    case SAUMON = 'saumon';
    case VIEUX_ROSE = 'vieux rose';
    case PELURE_D_OIGNON = 'pelure d\'oignon';
}
