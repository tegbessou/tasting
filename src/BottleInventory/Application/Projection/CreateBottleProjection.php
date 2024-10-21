<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Projection\Projector\CreateBottleProjector;
use App\BottleInventory\Domain\Event\BottleCreated;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleId;

final readonly class CreateBottleProjection
{
    public function __construct(
        private CreateBottleProjector $createBottleProjector,
        private BottleRepositoryInterface $bottleRepository,
    ) {
    }

    public function __invoke(BottleCreated $event): void
    {
        $bottle = $this->bottleRepository->ofId(
            BottleId::fromString(
                $event->bottleId
            ),
        );

        if ($bottle === null) {
            throw new \LogicException('Bottle not found');
        }

        $this->createBottleProjector->project($bottle);
    }
}
