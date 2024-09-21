<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Event;

use App\Shared\Domain\Event\DomainEvent;
use App\Shared\Domain\Event\DomainEventInterface;

final class BottleCreated extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $bottleId,
        public string $ownerId,
    ) {
        parent::__construct();
    }
}
