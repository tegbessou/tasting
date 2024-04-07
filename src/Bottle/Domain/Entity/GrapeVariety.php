<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Entity;

use App\Bottle\Domain\Event\GrapeVarietyCreatedEvent;
use App\Bottle\Domain\ValueObject\GrapeVarietyId;
use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use Doctrine\ORM\Mapping as ORM;

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
            new GrapeVarietyCreatedEvent(
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
