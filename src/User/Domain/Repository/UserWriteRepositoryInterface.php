<?php

declare(strict_types=1);

namespace App\User\Domain\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;

interface UserWriteRepositoryInterface
{
    public function ofEmail(UserEmail $email): ?User;

    public function nextIdentity(): UserId;

    public function add(User $user): void;
}
