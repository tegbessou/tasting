<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\Enum\Matiere;

final readonly class MouthMatiere
{
    private Matiere $value;

    public function __construct(
        string $value,
    ) {
        $this->value = Matiere::from($value);
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
