<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Bottle\Domain\Repository\BottleWriteRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class DeleteBottleCommandHandler
{
    public function __construct(
        private BottleWriteRepositoryInterface $bottleWriteRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(DeleteBottleCommand $removeBottleCommand): void
    {
        $bottle = $this->bottleWriteRepository->ofId(
            new BottleId($removeBottleCommand->id)
        );

        if ($bottle === null) {
            return;
        }

        $bottle->delete();

        $this->eventDispatcher->dispatch($bottle);

        $this->bottleWriteRepository->delete($bottle);
    }
}
