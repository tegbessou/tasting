<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Bottle\Domain\Entity\GrapeVariety;
use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleGrapeVarieties
{
    /** @var GrapeVariety[] */
    #[ORM\Column(type: 'json')]
    private array $grapeVarieties;

    public function __construct(
        array $grapeVariety = [],
    ) {
        Assert::isArray($grapeVariety);

        $this->grapeVarieties = $grapeVariety;
    }

    public static function fromArray(
        array $grapeVarieties = [],
    ): self {
        return new self(
            $grapeVarieties,
        );
    }

    public function add(
        GrapeVariety $grapeVariety,
    ): self {
        return new self(
            array_merge(
                $this->grapeVarieties,
                [$grapeVariety]
            )
        );
    }

    public function grapeVarieties(): array
    {
        return $this->grapeVarieties;
    }
}
