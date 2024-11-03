<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Adapter;

use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Domain\ValueObject\UserId;

interface UserAdapterInterface
{
    public function ofId(UserId $email): ?User;
}
