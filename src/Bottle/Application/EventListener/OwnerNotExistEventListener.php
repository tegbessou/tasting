<?php

declare(strict_types=1);

namespace App\Bottle\Application\EventListener;

use App\Bottle\Domain\Exception\BottleOwnerDoesntExistException;
use App\User\Domain\Event\OwnerNotExistEvent;

final readonly class OwnerNotExistEventListener
{
    public function __invoke(
        OwnerNotExistEvent $event,
    ): never {
        throw new BottleOwnerDoesntExistException($event->ownerId);
    }
}
