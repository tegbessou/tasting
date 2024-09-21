<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Event;

use App\Shared\Domain\Event\DomainEventInterface;
use Symfony\Contracts\EventDispatcher\Event;

final class OwnerCreated extends Event implements DomainEventInterface
{
    public function __construct(
        public string $ownerId,
    ) {
    }
}
