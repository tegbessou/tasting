<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;

final readonly class EyeLimpidite
{
    public function __construct(
        private Limpidite $value,
    ) {
    }

    public static function fromString(string $value): self
    {
        return new self(
            Limpidite::from($value),
        );
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
