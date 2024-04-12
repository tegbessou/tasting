<?php

declare(strict_types=1);

namespace App\Bottle\Application\EventListener;

use App\Bottle\Domain\Exception\DeleteBottleNotAuthorizeForThisUserException;
use App\User\Application\Event\BottleDeletedNotAuthorizeEvent;

final readonly class OnBottleDeletedNotAuthorizeEventListener
{
    public function __invoke(
        BottleDeletedNotAuthorizeEvent $event,
    ): never {
        throw new DeleteBottleNotAuthorizeForThisUserException();
    }
}
