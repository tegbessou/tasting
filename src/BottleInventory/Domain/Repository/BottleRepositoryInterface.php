<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\ValueObject\BottleId;

interface BottleRepositoryInterface
{
    public function ofId(BottleId $bottleId): ?Bottle;

    public function add(Bottle $bottle): void;

    public function nextIdentity(): BottleId;

    public function update(Bottle $bottle): void;

    public function delete(Bottle $bottle): void;
}
