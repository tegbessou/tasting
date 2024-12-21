<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum OrangeTeinte: string
{
    case JAUNE_DORE = 'Jaune doré';
    case AMBRE = 'Ambre';
    case CUIVRE = 'Cuivré';
    case INTENSE_ORANGE = 'Orange intense';
}
