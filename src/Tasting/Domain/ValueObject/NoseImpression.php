<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\Impression;

final readonly class NoseImpression
{
    private Impression $value;

    public function __construct(
        string $value,
    ) {
        $this->value = Impression::from($value);
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
