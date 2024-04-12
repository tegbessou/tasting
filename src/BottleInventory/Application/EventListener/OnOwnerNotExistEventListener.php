<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\EventListener;

use App\BottleInventory\Domain\Exception\BottleOwnerDoesntExistException;
use App\Security\Application\Event\OwnerNotExistEvent;

final readonly class OnOwnerNotExistEventListener
{
    public function __invoke(
        OwnerNotExistEvent $event,
    ): never {
        throw new BottleOwnerDoesntExistException($event->ownerId);
    }
}
