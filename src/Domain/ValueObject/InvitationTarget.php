<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class InvitationTarget
{
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::email($value);

        $this->value = $value;
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
