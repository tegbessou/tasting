<?php

declare(strict_types=1);

namespace App\Bottle\Application\EventListener;

use App\Bottle\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\User\Application\Event\BottleUpdatedNotAuthorizeEvent;

final readonly class OnBottleUpdatedNotAuthorizeEventListener
{
    public function __invoke(
        BottleUpdatedNotAuthorizeEvent $event,
    ): never {
        throw new UpdateBottleNotAuthorizeForThisUserException();
    }
}
