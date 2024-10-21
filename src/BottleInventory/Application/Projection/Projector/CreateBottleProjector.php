<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection\Projector;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\ReadModel\Bottle;
use App\BottleInventory\Domain\Adapter\UserAdapterInterface;
use App\BottleInventory\Domain\Entity\Bottle as BottleEntity;
use App\BottleInventory\Domain\ValueObject\UserId;

final readonly class CreateBottleProjector
{
    public function __construct(
        private BottleAdapterInterface $bottleAdapter,
        private UserAdapterInterface $userAdapter,
    ) {
    }

    public function project(BottleEntity $bottle): void
    {
        $owner = $this->userAdapter->ofId(
            UserId::fromString($bottle->ownerId()->value()),
        );

        if ($owner === null) {
            throw new \LogicException('Owner not found');
        }

        $bottle = new Bottle(
            $bottle->id()->value(),
            $bottle->name()->value(),
            $bottle->estateName()->value(),
            $bottle->rate()->value(),
            $bottle->year()->value(),
            $bottle->wineType()->value(),
            $bottle->savedAt()?->dateUs() ?? (new \DateTimeImmutable())->format('Y-m-d'),
            $bottle->grapeVarieties()->values(),
            $owner->id()->value(),
            $owner->name()->value(),
            $bottle->country()?->value(),
            $bottle->price()?->amount(),
        );

        $this->bottleAdapter->add($bottle);
    }
}
