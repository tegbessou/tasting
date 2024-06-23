<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Firebase\Security\LogIn;

use App\Security\Domain\Service\LogInInterface;
use App\Security\Domain\ValueObject\UserServiceLoggedIn;
use App\Security\Domain\ValueObject\UserServiceLoggedInToken;
use Kreait\Firebase\Contract\Auth;

final readonly class LogInFakeFirebase implements LogInInterface
{
    public function __construct(
        /** @phpstan-ignore-next-line */
        private Auth $auth,
    ) {
    }

    #[\Override]
    public function logInWithEmail(string $email, string $password): UserServiceLoggedIn
    {
        return UserServiceLoggedIn::create(
            UserServiceLoggedInToken::fromString('eyJhbGciOiJSUzI1NiIsImtpZCI6ImYwOGU2ZTNmNzg4ZDYwMTk0MDA1ZGJiYzE5NDc0YmY5Mjg5ZDM5ZWEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcG9jL'),
        );
    }
}
