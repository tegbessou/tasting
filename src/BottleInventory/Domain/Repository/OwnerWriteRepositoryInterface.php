<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\ValueObject\OwnerId;

interface OwnerWriteRepositoryInterface
{
    public function ofId(OwnerId $ownerId): ?Owner;

    public function add(Owner $owner): void;

    public function nextIdentity(): OwnerId;
}
