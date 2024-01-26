<?php

declare(strict_types=1);

namespace App\User\Infrastructure\Firebase\Security\Authenticator;

use App\User\Domain\Exception\ExpiredTokenException;
use App\User\Domain\Exception\InvalidPayloadException;
use App\User\Domain\Service\AuthenticateUserInterface;
use App\User\Domain\ValueObject\UserAuthenticated;
use Kreait\Firebase\Auth\SignIn\FailedToSignIn;
use Kreait\Firebase\Contract\Auth;
use Lexik\Bundle\JWTAuthenticationBundle\Exception\InvalidTokenException;

final readonly class AuthenticateUserFake implements AuthenticateUserInterface
{
    public function __construct(
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
