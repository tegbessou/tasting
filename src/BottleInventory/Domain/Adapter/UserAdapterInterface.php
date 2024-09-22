<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Adapter;

use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\User;

interface UserAdapterInterface
{
    public function ofEmail(OwnerEmail $email): ?User;
}
