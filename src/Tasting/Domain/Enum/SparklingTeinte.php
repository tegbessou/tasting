<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum SparklingTeinte: string
{
    case PALE_YELLOW = 'Jaune pâle';
    case GOLDEN = 'Doré';
    case BRILLANT_WHITE = 'Blanc brillant';
    case ROSE = 'Rosé';
    case DEEP_YELLOW = 'Jaune soutenu';
}
