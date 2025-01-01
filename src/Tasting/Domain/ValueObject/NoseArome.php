<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\Arome;

final readonly class NoseArome
{
    private Arome $value;

    public function __construct(
        string $value,
    ) {
        $this->value = Arome::from($value);
    }

    public static function fromString(string $value): self
    {
        return new self($value);
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
