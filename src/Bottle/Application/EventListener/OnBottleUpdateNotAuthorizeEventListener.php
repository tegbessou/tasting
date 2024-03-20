<?php

declare(strict_types=1);

namespace App\Bottle\Application\EventListener;

use App\Bottle\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\User\Domain\Event\BottleUpdateNotAuthorizeEvent;

final readonly class OnBottleUpdateNotAuthorizeEventListener
{
    public function __invoke(
        BottleUpdateNotAuthorizeEvent $event,
    ): never {
        throw new UpdateBottleNotAuthorizeForThisUserException();
    }
}
