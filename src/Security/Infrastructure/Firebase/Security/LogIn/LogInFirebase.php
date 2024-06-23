<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Firebase\Security\LogIn;

use App\Security\Domain\Exception\InvalidPayloadException;
use App\Security\Domain\Service\LogInInterface;
use App\Security\Domain\ValueObject\UserServiceLoggedIn;
use App\Security\Domain\ValueObject\UserServiceLoggedInToken;
use Kreait\Firebase\Auth\SignIn\FailedToSignIn;
use Kreait\Firebase\Contract\Auth;
use Lexik\Bundle\JWTAuthenticationBundle\Exception\InvalidTokenException;

final readonly class LogInFirebase implements LogInInterface
{
    public function __construct(
        private Auth $auth,
    ) {
    }

    #[\Override]
    public function logInWithEmail(string $email, string $password): UserServiceLoggedIn
    {
        try {
            $payload = $this->auth->signInWithEmailAndPassword(
                $email,
                $password,
            );
        } catch (FailedToSignIn) {
            throw new InvalidTokenException();
        }

        if (!isset($payload->data()['idToken'])) {
            throw new InvalidPayloadException($payload->data()['idToken'] ?? '');
        }

        return new UserServiceLoggedIn(
            UserServiceLoggedInToken::fromString($payload->data()['idToken']),
        );
    }
}
