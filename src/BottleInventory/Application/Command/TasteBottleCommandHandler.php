<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\BottleInventory\Domain\Repository\BottleWriteRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class TasteBottleCommandHandler
{
    public function __construct(
        private BottleWriteRepositoryInterface $bottleWriteRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(
        TasteBottleCommand $command,
    ): void {
        $bottle = $this->bottleWriteRepository->ofId(
            BottleId::fromString($command->id),
        );

        if ($bottle === null) {
            return;
        }

        $bottle->taste();

        $this->eventDispatcher->dispatch($bottle);

        $this->bottleWriteRepository->update($bottle);
    }
}
