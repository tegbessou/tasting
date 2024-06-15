<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\ValueObject\OwnerId;

interface OwnerReadRepositoryInterface
{
    public function ofId(OwnerId $id): ?Owner;

    public function exist(OwnerId $id): bool;
}
