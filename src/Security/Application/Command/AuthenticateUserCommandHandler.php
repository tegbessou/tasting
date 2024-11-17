<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Exception\InvalidTokenException;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\Service\AuthenticateUser;
use App\Security\Domain\ValueObject\UserAuthenticated;
use App\Security\Domain\ValueObject\UserEmail;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class AuthenticateUserCommandHandler
{
    public function __construct(
        private AuthenticateUser $authenticateUser,
        private DomainEventDispatcherInterface $dispatcher,
        private UserRepositoryInterface $userRepository,
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

        $userAuthenticated = $this->authenticateUser->authenticateUser(
            $authenticateUserCommand->token,
            $authenticateUserCommand->providerId,
        );

        $user = $this->userRepository->ofEmail(
            UserEmail::fromString($userAuthenticated->email()->value()),
        );

        if ($user === null) {
            $user = User::create(
                $this->userRepository->nextIdentity(),
                UserEmail::fromString($userAuthenticated->email()->value()),
            );

            $this->userRepository->add($user);
        }

        $this->dispatcher->dispatch($user);

        return $userAuthenticated;
    }
}
