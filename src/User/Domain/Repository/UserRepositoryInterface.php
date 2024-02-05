<?php

declare(strict_types=1);

namespace App\User\Domain\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;

interface UserRepositoryInterface
{
    public function ofEmail(UserEmail $email): ?User;

    public function exist(UserEmail $email): bool;

    public function nextIdentity(): UserId;

    public function add(User $user): void;
}
