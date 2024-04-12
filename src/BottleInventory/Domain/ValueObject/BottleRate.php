<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\ValueObject;

use App\BottleInventory\Domain\Enum\Rate;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleRate
{
    public function __construct(#[ORM\Column(name: 'rate', type: 'string', length: 2, enumType: Rate::class)]
        private Rate $value)
    {
    }

    public static function fromString(
        string $value,
    ): self {
        return new self(Rate::from($value));
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
