<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Entity;

use App\BottleInventory\Domain\Event\GrapeVarietyCreated;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyId;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;
use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityDomainEventTrait;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityWithDomainEventInterface;

#[ORM\Entity]
final class GrapeVariety implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

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
        $grapeVariety = new self(
            $id,
            $name,
        );

        $grapeVariety::recordEvent(
            new GrapeVarietyCreated(
                $grapeVariety->id->value(),
            )
        );

        return $grapeVariety;
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
