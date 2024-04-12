<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\EventListener;

use App\BottleInventory\Domain\Exception\DeleteBottleNotAuthorizeForThisUserException;
use App\Security\Application\Event\BottleDeletedNotAuthorizeEvent;

final readonly class OnBottleDeletedNotAuthorizeEventListener
{
    public function __invoke(
        BottleDeletedNotAuthorizeEvent $event,
    ): never {
        throw new DeleteBottleNotAuthorizeForThisUserException();
    }
}
