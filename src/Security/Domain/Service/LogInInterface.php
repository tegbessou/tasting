<?php

declare(strict_types=1);

namespace App\Security\Domain\Service;

use App\Security\Domain\ValueObject\UserServiceLoggedIn;

interface LogInInterface
{
    public function logInWithEmail(string $email, string $password): UserServiceLoggedIn;
}
