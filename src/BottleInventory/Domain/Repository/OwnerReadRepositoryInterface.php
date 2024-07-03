<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Domain\Repository\ReadRepositoryInterface;

/**
 * @extends ReadRepositoryInterface<Owner>
 */
interface OwnerReadRepositoryInterface extends ReadRepositoryInterface
{
    public function ofId(OwnerId $id): ?Owner;

    public function ofEmail(OwnerEmail $email): ?Owner;

    public function exist(OwnerId $id): bool;
}
