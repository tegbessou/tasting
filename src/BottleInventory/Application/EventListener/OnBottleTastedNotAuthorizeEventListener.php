<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\EventListener;

use App\BottleInventory\Domain\Exception\TasteBottleNotAuthorizeForThisUserException;
use App\Security\Application\Event\BottleTastedNotAuthorizeEvent;

final readonly class OnBottleTastedNotAuthorizeEventListener
{
    public function __invoke(
        BottleTastedNotAuthorizeEvent $event,
    ): never {
        throw new TasteBottleNotAuthorizeForThisUserException();
    }
}
