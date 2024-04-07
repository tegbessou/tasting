<?php

declare(strict_types=1);

namespace App\User\Application\EventListener;

use App\Bottle\Domain\Event\BottleCreatedEvent;
use App\User\Application\Event\OwnerNotExistEvent;
use App\User\Domain\Repository\UserReadRepositoryInterface;
use App\User\Domain\ValueObject\UserId;
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
