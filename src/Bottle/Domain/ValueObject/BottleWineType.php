<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Bottle\Domain\Enum\WineType;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleWineType
{
    public function __construct(#[ORM\Column(name: 'type', type: 'string', length: 255, enumType: WineType::class)]
        private WineType $value)
    {
    }

    public static function fromString(string $value): self
    {
        return new self(WineType::from($value));
    }

    public function value(): string
    {
        return $this->value->value;
    }
}
