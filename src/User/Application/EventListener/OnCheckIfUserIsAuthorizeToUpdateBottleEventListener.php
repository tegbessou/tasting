<?php

declare(strict_types=1);

namespace App\User\Application\EventListener;

use App\Bottle\Domain\Event\CheckIfUserIsAuthorizeToUpdateBottleEvent;
use App\User\Domain\Event\BottleUpdateNotAuthorizeEvent;
use App\User\Domain\Service\GetUserAuthenticatedInterface;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

final readonly class OnCheckIfUserIsAuthorizeToUpdateBottleEventListener
{
    public function __construct(
        private GetUserAuthenticatedInterface $getUserAuthenticated,
        private EventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(
        CheckIfUserIsAuthorizeToUpdateBottleEvent $event,
    ): void {
        $user = $this->getUserAuthenticated->getUser();

        if ($event->ownerId === $user->id()->value()) {
            return;
        }

        $this->eventDispatcher->dispatch(new BottleUpdateNotAuthorizeEvent($event->ownerId));
    }
}
