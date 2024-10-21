<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;

final readonly class AddPictureBottleProjector
{
    public function __construct(
        private BottleAdapterInterface $bottleAdapter,
    ) {
    }

    public function project(string $bottleId, string $picture): void
    {
        $bottle = $this->bottleAdapter->ofId($bottleId);

        if ($bottle === null) {
            throw new BottleDoesntExistException($bottleId);
        }

        $bottle->picture = $picture;

        $this->bottleAdapter->update($bottle);
    }
}
