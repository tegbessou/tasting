<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Bottle\Domain\Enum\WineType;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleWineType
{
    public function __construct(#[ORM\Column(type: 'string', length: 255, enumType: WineType::class)]
        private WineType $type)
    {
    }

    public static function fromString(string $wineType): self
    {
        return new self(WineType::from($wineType));
    }

    public function wineType(): string
    {
        return $this->type->value;
    }
}
