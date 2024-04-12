<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Event;

use App\Shared\Domain\Event\DomainEventInterface;

final readonly class BottleUpdatedEvent implements DomainEventInterface
{
    public function __construct(
        public string $bottleId,
        public string $ownerId,
    ) {
    }
}
