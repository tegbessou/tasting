<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\Tanin;

final readonly class MouthTanin
{
    private Tanin $value;

    public function __construct(
        string $value,
    ) {
        $this->value = Tanin::from($value);
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
