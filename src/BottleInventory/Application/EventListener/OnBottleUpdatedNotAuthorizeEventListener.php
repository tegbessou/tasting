<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\EventListener;

use App\BottleInventory\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\Security\Application\Event\BottleUpdatedNotAuthorizeEvent;

final readonly class OnBottleUpdatedNotAuthorizeEventListener
{
    public function __invoke(
        BottleUpdatedNotAuthorizeEvent $event,
    ): never {
        throw new UpdateBottleNotAuthorizeForThisUserException();
    }
}
