<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Event;

use Symfony\Contracts\EventDispatcher\Event;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class OwnerCreated extends Event implements DomainEventInterface
{
    public function __construct(
        public string $ownerId,
    ) {
    }
}
