<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\Acide;

final readonly class MouthAcide
{
    private Acide $value;

    public function __construct(
        string $value,
    ) {
        $this->value = Acide::from($value);
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
