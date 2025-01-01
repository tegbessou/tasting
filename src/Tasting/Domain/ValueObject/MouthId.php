<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class MouthId
{
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::uuid($value);

        $this->value = $value;
    }

    public static function fromString(string $value): self
    {
        return new self($value);
    }

    public function value(): string
    {
        return $this->value;
    }
}
