<?php

declare(strict_types=1);

namespace App\Security\Application\EventListener;

use App\BottleInventory\Domain\Event\BottleCreatedEvent;
use App\Security\Application\Event\OwnerNotExistEvent;
use App\Security\Domain\Repository\UserReadRepositoryInterface;
use App\Security\Domain\ValueObject\UserId;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

final readonly class OnBottleCreatedCheckIfOwnerExistEventListener
{
    public function __construct(
        private EventDispatcherInterface $eventDispatcher,
        private UserReadRepositoryInterface $userReadRepository,
    ) {
    }

    public function __invoke(BottleCreatedEvent $event): void
    {
        if ($this->userReadRepository->existWithId(UserId::fromString($event->ownerId))) {
            return;
        }

        $this->eventDispatcher->dispatch(new OwnerNotExistEvent($event->ownerId));
    }
}
