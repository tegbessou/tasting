<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Owner>
 */
interface OwnerRepositoryInterface extends RepositoryInterface
{
    public function ofId(OwnerId $id): ?Owner;

    public function ofEmail(OwnerEmail $email): ?Owner;

    public function exist(OwnerId $id): bool;

    public function add(Owner $owner): void;

    public function nextIdentity(): OwnerId;
}
