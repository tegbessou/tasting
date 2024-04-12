<?php

declare(strict_types=1);

namespace App\Security\Application\EventListener;

use App\BottleInventory\Domain\Event\BottlePictureAddedEvent;
use App\Security\Application\Event\BottleUpdatedNotAuthorizeEvent;
use App\Security\Domain\Service\GetUserAuthenticatedInterface;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

final readonly class OnBottleAddedPictureCheckIfUserIsAuthorizeToUpdateBottleEventListener
{
    public function __construct(
        private GetUserAuthenticatedInterface $getUserAuthenticated,
        private EventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(
        BottlePictureAddedEvent $event,
    ): void {
        $user = $this->getUserAuthenticated->getUser();

        if ($event->ownerId === $user->id()->value()) {
            return;
        }

        $this->eventDispatcher->dispatch(new BottleUpdatedNotAuthorizeEvent($event->ownerId));
    }
}
