<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleGrapeVarieties
{
    #[ORM\Column(name: 'grape_varieties', type: 'json')]
    private array $values;

    public function __construct(
        array $values = [],
    ) {
        Assert::isArray($values);

        $this->values = $values;
    }

    public static function fromArray(
        array $values = [],
    ): self {
        return new self(
            $values,
        );
    }

    public function add(
        string $grapeVariety,
    ): self {
        return new self(
            array_merge(
                $this->values,
                [$grapeVariety]
            )
        );
    }

    public function values(): array
    {
        return $this->values;
    }
}
