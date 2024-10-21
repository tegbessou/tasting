<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleListAdapterInterface;
use App\BottleInventory\Application\ReadModel\BottleList;
use App\BottleInventory\Domain\Entity\Bottle;

final readonly class CreateBottleListProjector
{
    public function __construct(
        private BottleListAdapterInterface $bottleListAdapter,
    ) {
    }

    public function project(Bottle $bottle): void
    {
        $bottle = new BottleList(
            $bottle->id()->value(),
            $bottle->name()->value(),
            $bottle->estateName()->value(),
            $bottle->rate()->value(),
            $bottle->year()->value(),
            $bottle->wineType()->value(),
            $bottle->savedAt()?->dateUs() ?? (new \DateTimeImmutable())->format('Y-m-d'),
            $bottle->ownerId()->value(),
        );

        $this->bottleListAdapter->add($bottle);
    }
}
