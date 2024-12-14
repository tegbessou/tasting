<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\EmpireDesAmis\Security\LogIn;

use App\Security\Domain\Service\LogInInterface;
use App\Security\Domain\ValueObject\UserServiceLoggedIn;
use App\Security\Domain\ValueObject\UserServiceLoggedInToken;
use EmpireDesAmis\SecurityAuthenticatorBundle\Firebase\Security\LogIn\LogInFirebase;

final readonly class LogInEmpireDesAmis implements LogInInterface
{
    public function __construct(
        private LogInFirebase $auth,
    ) {
    }

    #[\Override]
    public function logInWithEmail(string $email, string $password): UserServiceLoggedIn
    {
        $token = $this->auth->logInWithEmail(
            $email,
            $password,
        );

        return new UserServiceLoggedIn(
            UserServiceLoggedInToken::fromString($token->token),
        );
    }
}
