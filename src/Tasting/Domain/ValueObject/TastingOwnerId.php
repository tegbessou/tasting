<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;

final readonly class TastingOwnerId
{
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::minLength($value, 36);
        Assert::maxLength($value, 36);
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
