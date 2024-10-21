<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class BottleCreated extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $bottleId,
    ) {
        parent::__construct();
    }
}
