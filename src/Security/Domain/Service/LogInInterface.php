<?php

declare(strict_types=1);

namespace App\Security\Domain\Service;

use App\Security\Domain\ValueObject\UserServiceLoggedIn;

interface LogInInterface
{
    /**
     * @param non-empty-string $email
     * @param non-empty-string $password
     */
    public function logInWithEmail(string $email, string $password): UserServiceLoggedIn;
}
