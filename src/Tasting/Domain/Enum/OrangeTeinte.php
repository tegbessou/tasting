<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum OrangeTeinte: string
{
    case JAUNE_DORE = 'jaune doré';
    case AMBRE = 'ambre';
    case CUIVRE = 'cuivré';
    case INTENSE_ORANGE = 'orange intense';
}
