<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum SparklingTeinte: string
{
    case PALE_YELLOW = 'jaune pâle';
    case GOLDEN = 'doré';
    case BRILLANT_WHITE = 'blanc brillant';
    case ROSE = 'rosé';
    case DEEP_YELLOW = 'jaune soutenu';
}
