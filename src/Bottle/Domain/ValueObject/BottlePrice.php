<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottlePrice
{
    #[ORM\Column(type: 'float')]
    private float $price;

    public function __construct(
        float $price,
    ) {
        Assert::positiveFloat($price);

        $this->price = $price;
    }

    public static function fromFloat(
        float $price,
    ): self {
        return new self($price);
    }

    public function price(): float
    {
        return $this->price;
    }
}
