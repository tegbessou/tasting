<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\Larme;

final readonly class EyeLarme
{
    public function __construct(
        private Larme $value,
    ) {
    }

    public static function fromString(string $value): self
    {
        return new self(
            Larme::from($value),
        );
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
