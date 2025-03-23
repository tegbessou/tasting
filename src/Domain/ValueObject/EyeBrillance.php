<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\Enum\Brillance;

final readonly class EyeBrillance
{
    public function __construct(
        private Brillance $value,
    ) {
    }

    public static function fromString(string $value): self
    {
        return new self(Brillance::from($value));
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
