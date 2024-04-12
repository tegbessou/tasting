<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Firebase\Security\Authenticator;

use App\Security\Domain\Service\AuthenticateUserInterface;
use App\Security\Domain\ValueObject\UserAuthenticated;
use Kreait\Firebase\Contract\Auth;

final readonly class AuthenticateUserFakeFirebase implements AuthenticateUserInterface
{
    public function __construct(
        /** @phpstan-ignore-next-line */
        private Auth $auth,
    ) {
    }

    #[\Override]
    public function authenticateUserWithApple(string $token): UserAuthenticated
    {
        return new UserAuthenticated('hugues.gobet@gmail.com');
    }

    #[\Override]
    public function authenticateUserWithGoogle(string $token): UserAuthenticated
    {
        return new UserAuthenticated('hugues.gobet@gmail.com');
    }
}
