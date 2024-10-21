<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\BottleInventory\Domain\Exception\BottleDoesntExistException;
use App\BottleInventory\Domain\Exception\DeleteBottleNotAuthorizeForThisUserException;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\Service\Authorization;
use App\BottleInventory\Domain\ValueObject\BottleId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class DeleteBottleCommandHandler
{
    public function __construct(
        private BottleRepositoryInterface $bottleRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
        private Authorization $authorizationService,
    ) {
    }

    public function __invoke(DeleteBottleCommand $removeBottleCommand): void
    {
        $bottle = $this->bottleRepository->ofId(
            new BottleId($removeBottleCommand->id)
        );

        if ($bottle === null) {
            throw new BottleDoesntExistException($removeBottleCommand->id);
        }

        if (
            $this->authorizationService->isCurrentUserOwnerOfTheBottle($bottle) === false
        ) {
            throw new DeleteBottleNotAuthorizeForThisUserException();
        }

        $bottle->delete();

        $this->bottleRepository->delete($bottle);

        $this->eventDispatcher->dispatch($bottle);
    }
}
