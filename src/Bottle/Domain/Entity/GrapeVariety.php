<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Entity;

use App\Bottle\Domain\ValueObject\GrapeVarietyId;
use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final readonly class GrapeVariety
{
    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        public GrapeVarietyId $id,
        #[ORM\Embedded(columnPrefix: false)]
        public GrapeVarietyName $name,
    ) {
    }

    public static function create(
        GrapeVarietyId $id,
        GrapeVarietyName $name,
    ): self {
        return new self(
            $id,
            $name,
        );
    }

    public function id(): GrapeVarietyId
    {
        return $this->id;
    }

    public function name(): GrapeVarietyName
    {
        return $this->name;
    }
}
