<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\WineType;

final readonly class Bottle
{
    public function __construct(
        private string $name,
        private WineType $wineType,
    ) {
    }

    public static function create(
        string $name,
        string $wineType,
    ): self {
        return new self(
            $name,
            WineType::from($wineType),
        );
    }

    public function name(): string
    {
        return $this->name;
    }

    public function wineType(): WineType
    {
        return $this->wineType;
    }
}
