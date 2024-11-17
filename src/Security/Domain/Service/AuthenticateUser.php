<?php

declare(strict_types=1);

namespace App\Security\Domain\Service;

use App\Security\Domain\Exception\IdentityProviderDoesntExistException;
use App\Security\Domain\ValueObject\UserAuthenticated;

final readonly class AuthenticateUser
{
    public function __construct(
        private AuthenticateUserFromProviderInterface $authenticateUserFromProvider,
    ) {
    }

    public function authenticateUser(string $token, string $providerId): UserAuthenticated
    {
        match ($providerId) {
            AuthenticateUserFromProviderInterface::IDENTITY_PROVIDER_APPLE => $userAuthenticated = $this->authenticateUserFromProvider->authenticateUserWithApple($token),
            AuthenticateUserFromProviderInterface::IDENTITY_PROVIDER_GOOGLE => $userAuthenticated = $this->authenticateUserFromProvider->authenticateUserWithGoogle($token),
            AuthenticateUserFromProviderInterface::IDENTITY_PROVIDER_FIREBASE => $userAuthenticated = $this->authenticateUserFromProvider->authenticateUserWithFirebase($token),
            default => throw new IdentityProviderDoesntExistException('Invalid provider id'),
        };

        return $userAuthenticated;
    }
}
