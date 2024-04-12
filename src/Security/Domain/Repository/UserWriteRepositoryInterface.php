<?php

declare(strict_types=1);

namespace App\Security\Domain\Repository;

use App\Security\Domain\Entity\User;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;

interface UserWriteRepositoryInterface
{
    public function ofEmail(UserEmail $email): ?User;

    public function nextIdentity(): UserId;

    public function add(User $user): void;
}
