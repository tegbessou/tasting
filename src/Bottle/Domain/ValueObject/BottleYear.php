<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleYear
{
    #[ORM\Column(name: 'year', type: 'integer', length: 4)]
    private int $value;

    public function __construct(
        int $value,
    ) {
        Assert::year($value);

        $this->value = $value;
    }

    public static function fromInt(
        int $value,
    ): self {
        return new self($value);
    }

    public function value(): int
    {
        return $this->value;
    }
}
