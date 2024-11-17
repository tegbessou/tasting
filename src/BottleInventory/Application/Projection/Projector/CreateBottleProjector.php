<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Exception\OwnerDoesntExistException;
use App\BottleInventory\Application\ReadModel\Bottle;
use App\BottleInventory\Domain\Adapter\UserAdapterInterface;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\UserId;

final readonly class CreateBottleProjector
{
    public function __construct(
        private BottleAdapterInterface $bottleAdapter,
        private UserAdapterInterface $userAdapter,
        private BottleRepositoryInterface $bottleRepository,
    ) {
    }

    public function project(
        string $bottleId,
        string $name,
        string $estateName,
        string $wineType,
        int $year,
        string $rate,
        array $grapeVarieties,
        string $savedAt,
        string $ownerId,
        ?string $country = null,
        ?float $price = null,
    ): void {
        $bottle = $this->bottleRepository->ofId(
            BottleId::fromString(
                $bottleId,
            ),
        );

        if ($bottle === null) {
            throw new BottleDoesntExistException($bottleId);
        }

        $owner = $this->userAdapter->ofId(
            UserId::fromString($ownerId),
        );

        if ($owner === null) {
            throw new OwnerDoesntExistException($ownerId);
        }

        $bottle = new Bottle(
            $bottleId,
            $name,
            $estateName,
            $rate,
            $year,
            $wineType,
            $savedAt,
            $grapeVarieties,
            $owner->id()->value(),
            $owner->name()->value(),
            $country,
            $price,
        );

        $this->bottleAdapter->add($bottle);
    }
}
