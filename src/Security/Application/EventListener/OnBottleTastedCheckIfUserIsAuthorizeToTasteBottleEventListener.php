<?php

declare(strict_types=1);

namespace App\Security\Application\EventListener;

use App\BottleInventory\Domain\Event\BottleTastedEvent;
use App\Security\Application\Event\BottleTastedNotAuthorizeEvent;
use App\Security\Domain\Service\GetUserAuthenticatedInterface;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

final readonly class OnBottleTastedCheckIfUserIsAuthorizeToTasteBottleEventListener
{
    public function __construct(
        private GetUserAuthenticatedInterface $getUserAuthenticated,
        private EventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(
        BottleTastedEvent $event,
    ): void {
        $user = $this->getUserAuthenticated->getUser();

        if ($event->ownerId === $user->id()->value()) {
            return;
        }

        $this->eventDispatcher->dispatch(new BottleTastedNotAuthorizeEvent($event->ownerId));
    }
}
