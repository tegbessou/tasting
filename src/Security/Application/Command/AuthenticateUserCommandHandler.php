<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Exception\IdentityProviderDoesntExistException;
use App\Security\Domain\Exception\InvalidTokenException;
use App\Security\Domain\Service\AuthenticateUserInterface;
use App\Security\Domain\ValueObject\UserAuthenticated;
use App\Shared\Application\Command\AsCommandHandler;

#[AsCommandHandler]
final readonly class AuthenticateUserCommandHandler
{
    public function __construct(
        private AuthenticateUserInterface $authenticateUser,
    ) {
    }

    /**
     * @throws InvalidTokenException
     */
    public function __invoke(AuthenticateUserCommand $authenticateUserCommand): UserAuthenticated
    {
        if ($authenticateUserCommand->token === '') {
            throw new InvalidTokenException();
        }

        match ($authenticateUserCommand->providerId) {
            AuthenticateUserInterface::IDENTITY_PROVIDER_APPLE => $userAuthenticated = $this->authenticateUser->authenticateUserWithApple($authenticateUserCommand->token),
            AuthenticateUserInterface::IDENTITY_PROVIDER_GOOGLE => $userAuthenticated = $this->authenticateUser->authenticateUserWithGoogle($authenticateUserCommand->token),
            AuthenticateUserInterface::IDENTITY_PROVIDER_FIREBASE => $userAuthenticated = $this->authenticateUser->authenticateUserWithFirebase($authenticateUserCommand->token),
            default => throw new IdentityProviderDoesntExistException('Invalid provider id'),
        };

        return $userAuthenticated;
    }
}
