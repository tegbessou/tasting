<?php

declare(strict_types=1);

namespace App\Security\Domain\Service;

use App\Security\Domain\ValueObject\UserAuthenticated;

interface AuthenticateUserInterface
{
    public const IDENTITY_PROVIDER_APPLE = 'apple.com';
    public const IDENTITY_PROVIDER_GOOGLE = 'google.com';

    /**
     * @param non-empty-string $token
     */
    public function authenticateUserWithApple(string $token): UserAuthenticated;

    /**
     * @param non-empty-string $token
     */
    public function authenticateUserWithGoogle(string $token): UserAuthenticated;
}
