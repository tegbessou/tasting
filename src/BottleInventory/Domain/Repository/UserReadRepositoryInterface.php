<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\User;

interface UserReadRepositoryInterface
{
    public function ofEmail(OwnerEmail $email): User;
}
