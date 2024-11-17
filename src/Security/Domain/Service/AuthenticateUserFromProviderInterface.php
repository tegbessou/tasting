<?php

declare(strict_types=1);

namespace App\Security\Domain\Service;

use App\Security\Domain\ValueObject\UserAuthenticated;

interface AuthenticateUserFromProviderInterface
{
    public const IDENTITY_PROVIDER_APPLE = 'apple.com';
    public const IDENTITY_PROVIDER_GOOGLE = 'google.com';
    public const IDENTITY_PROVIDER_FIREBASE = 'firebase.com';

    /**
     * @param non-empty-string $token
     */
    public function authenticateUserWithApple(string $token): UserAuthenticated;

    /**
     * @param non-empty-string $token
     */
    public function authenticateUserWithGoogle(string $token): UserAuthenticated;

    /**
     * @param non-empty-string $token
     */
    public function authenticateUserWithFirebase(string $token): UserAuthenticated;
}
