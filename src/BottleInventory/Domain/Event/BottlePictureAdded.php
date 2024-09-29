<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class BottlePictureAdded implements DomainEventInterface
{
    public function __construct(
        public string $bottleId,
        public string $ownerId,
    ) {
    }
}
