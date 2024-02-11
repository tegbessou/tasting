<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottlePrice
{
    #[ORM\Column(name: 'price', type: 'float', nullable: true)]
    private ?float $amount;

    public function __construct(
        float $amount,
    ) {
        Assert::positiveFloat($amount);

        $this->amount = $amount;
    }

    public static function fromFloat(
        float $amount,
    ): self {
        return new self($amount);
    }

    public function amount(): ?float
    {
        return $this->amount;
    }
}
