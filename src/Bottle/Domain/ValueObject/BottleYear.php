<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleYear
{
    #[ORM\Column(type: 'integer', length: 4)]
    private int $year;

    public function __construct(
        int $year,
    ) {
        Assert::year($year);

        $this->year = $year;
    }

    public static function fromInt(
        int $year,
    ): self {
        return new self($year);
    }

    public function year(): int
    {
        return $this->year;
    }
}
