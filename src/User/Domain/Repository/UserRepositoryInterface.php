<?php

declare(strict_types=1);

namespace App\User\Domain\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\Email;

interface UserRepositoryInterface
{
    public function findByEmail(Email $email): ?User;
}
