<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleListAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;

final readonly class AddPictureBottleListProjector
{
    public function __construct(
        private BottleListAdapterInterface $bottleListAdapter,
    ) {
    }

    public function project(string $bottleId, string $picture): void
    {
        $bottle = $this->bottleListAdapter->ofId($bottleId);

        if ($bottle === null) {
            throw new BottleDoesntExistException($bottleId);
        }

        $bottle->picture = $picture;

        $this->bottleListAdapter->update($bottle);
    }
}
