<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;

final readonly class CountryName
{
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::string($value);
        Assert::lengthBetween($value, 1, 255);

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
