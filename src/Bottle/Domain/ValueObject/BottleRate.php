<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Bottle\Domain\Enum\Rate;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleRate
{
    public function __construct(#[ORM\Column(type: 'string', length: 2, enumType: Rate::class)]
        private Rate $rate)
    {
    }

    public static function fromString(
        string $rate,
    ): self {
        return new self(Rate::from($rate));
    }

    public function rate(): string
    {
        return $this->rate->value;
    }
}
