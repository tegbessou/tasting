<?php

declare(strict_types=1);

namespace App\Security\Application\Adapter;

use App\Security\Application\ReadModel\User;

interface UserAdapterInterface
{
    public function ofId(string $id): ?User;

    public function add(User $user): void;
}
