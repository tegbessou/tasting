<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;

final readonly class TasteBottleProjector
{
    public function __construct(
        private BottleAdapterInterface $bottleAdapter,
    ) {
    }

    public function project(string $bottleId, string $tastedAt): void
    {
        $bottle = $this->bottleAdapter->ofId($bottleId);

        if ($bottle === null) {
            throw new BottleDoesntExistException($bottleId);
        }

        $bottle->tastedAt = $tastedAt;

        $this->bottleAdapter->update($bottle);
    }
}
