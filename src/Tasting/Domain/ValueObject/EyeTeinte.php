<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

final readonly class EyeTeinte
{
    public function __construct(
        private string $value,
    ) {
    }

    public static function fromString(string $value): self
    {
        return new self(
            $value,
        );
    }

    public function value(): string
    {
        return $this->value;
    }
}
