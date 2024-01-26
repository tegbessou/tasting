<?php

declare(strict_types=1);

namespace App\User\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\User\Domain\Exception\IdentityProviderDoesntExistException;
use App\User\Domain\Service\AuthenticateUserInterface;
use App\User\Domain\ValueObject\UserAuthenticated;

#[AsCommandHandler]
final readonly class AuthenticateUserCommandHandler
{
    public function __construct(
        private AuthenticateUserInterface $authenticateUser,
    ) {
    }

    public function __invoke(AuthenticateUserCommand $authenticateUserCommand): UserAuthenticated
    {
        match ($authenticateUserCommand->providerId) {
            AuthenticateUserInterface::IDENTITY_PROVIDER_APPLE => $userAuthenticated = $this->authenticateUser->authenticateUserWithApple($authenticateUserCommand->token),
            AuthenticateUserInterface::IDENTITY_PROVIDER_GOOGLE => $userAuthenticated = $this->authenticateUser->authenticateUserWithGoogle($authenticateUserCommand->token),
            default => throw new IdentityProviderDoesntExistException('Invalid provider id'),
        };

        return $userAuthenticated;
    }
}
