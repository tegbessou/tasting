<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\IntensiteCouleur;

final readonly class EyeIntensiteCouleur
{
    public function __construct(
        private IntensiteCouleur $value,
    ) {
    }

    public static function fromString(string $value): self
    {
        return new self(IntensiteCouleur::from($value));
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
