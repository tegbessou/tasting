<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Event;

use Symfony\Contracts\EventDispatcher\Event;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class GrapeVarietyCreated extends Event implements DomainEventInterface
{
    public function __construct(
        public string $grapeVarietyId,
    ) {
    }
}
