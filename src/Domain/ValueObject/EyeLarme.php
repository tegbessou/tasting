<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\Enum\Larme;

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
