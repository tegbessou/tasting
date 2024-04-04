<?php

declare(strict_types=1);

namespace App\User\Domain\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;

/**
 * Specifically, in the User entity we authorize this entity to be identified by its email and id, because for
 * authentication we need email, but to communicate between bounded contexts we need id.
 */
interface UserReadRepositoryInterface
{
    public function ofEmail(UserEmail $email): ?User;

    public function ofId(UserId $id): ?User;

    public function existWithId(UserId $id): bool;
}
