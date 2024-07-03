<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\BottleInventory\Translator;

use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\BottleName;

final readonly class BottleTranslator
{
    public static function toBottle(
        array $data,
    ): Bottle {
        return Bottle::create(
            BottleId::fromString($data['id']),
            BottleName::fromString($data['name']),
        );
    }
}
