<?php

declare(strict_types=1);

namespace App\User\Domain\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\Email;
use App\User\Domain\ValueObject\UserId;

interface UserRepositoryInterface
{
    public function findByEmail(Email $email): ?User;

    public function isAlreadyExist(Email $email): bool;

    public function nextIdentity(): UserId;

    public function add(User $user): void;
}
