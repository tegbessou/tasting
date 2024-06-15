<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\BottleInventory\Domain\Exception\BottleDoesntExistException;
use App\BottleInventory\Domain\Exception\DeleteBottleNotAuthorizeForThisUserException;
use App\BottleInventory\Domain\Repository\BottleWriteRepositoryInterface;
use App\BottleInventory\Domain\Service\AuthorizationService;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class DeleteBottleCommandHandler
{
    public function __construct(
        private BottleWriteRepositoryInterface $bottleWriteRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
        private AuthorizationService $authorizationService,
    ) {
    }

    public function __invoke(DeleteBottleCommand $removeBottleCommand): void
    {
        $bottle = $this->bottleWriteRepository->ofId(
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

        $this->eventDispatcher->dispatch($bottle);

        $this->bottleWriteRepository->delete($bottle);
    }
}
