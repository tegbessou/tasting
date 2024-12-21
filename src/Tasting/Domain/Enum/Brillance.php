<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Brillance: string
{
    case ETINCELANTE = 'étincelante';
    case ECLATANTE = 'éclatante';
    case BRILLANTE = 'brillante';
    case LUMINEUSE = 'lumineuse';
    case TERNE = 'terne';

    public static function values(): array
    {
        return [
            self::ETINCELANTE->value,
            self::ECLATANTE->value,
            self::BRILLANTE->value,
            self::LUMINEUSE->value,
            self::TERNE->value,
        ];
    }
}
