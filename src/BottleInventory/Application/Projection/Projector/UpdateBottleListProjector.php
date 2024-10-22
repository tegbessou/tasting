<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleListAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;

final readonly class UpdateBottleListProjector
{
    public function __construct(
        private BottleListAdapterInterface $bottleListAdapter,
    ) {
    }

    public function project(
        string $bottleId,
        string $name,
        string $estateName,
        string $wineType,
        int $year,
        string $rate,
    ): void {
        $bottle = $this->bottleListAdapter->ofId($bottleId);

        if ($bottle === null) {
            throw new BottleDoesntExistException($bottleId);
        }

        $bottle->name = $name;
        $bottle->estateName = $estateName;
        $bottle->wineType = $wineType;
        $bottle->year = $year;
        $bottle->rate = $rate;

        $this->bottleListAdapter->update($bottle);
    }
}
