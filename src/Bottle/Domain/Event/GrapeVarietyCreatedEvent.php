<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Event;

use App\Shared\Domain\Event\DomainEventInterface;
use Symfony\Contracts\EventDispatcher\Event;

final class GrapeVarietyCreatedEvent extends Event implements DomainEventInterface
{
    public function __construct(
        public string $grapeVarietyId,
    ) {
    }
}
