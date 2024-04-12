<?php

declare(strict_types=1);

namespace App\User\Application\EventListener;

use App\Bottle\Domain\Event\BottleDeletedEvent;
use App\User\Application\Event\BottleDeletedNotAuthorizeEvent;
use App\User\Domain\Service\GetUserAuthenticatedInterface;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

final readonly class OnBottleDeletedCheckIfUserIsAuthorizeToDeleteBottleEventListener
{
    public function __construct(
        private GetUserAuthenticatedInterface $getUserAuthenticated,
        private EventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(
        BottleDeletedEvent $event,
    ): void {
        $user = $this->getUserAuthenticated->getUser();

        if ($event->ownerId === $user->id()->value()) {
            return;
        }

        $this->eventDispatcher->dispatch(new BottleDeletedNotAuthorizeEvent($event->ownerId));
    }
}
