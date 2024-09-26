<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Exception\InvalidEmailException;
use App\Security\Domain\Exception\InvalidPasswordException;
use App\Security\Domain\Service\LogInInterface;
use App\Security\Domain\ValueObject\UserServiceLoggedIn;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;

#[AsCommandHandler]
final readonly class LogInUserServiceCommandHandler
{
    public function __construct(
        private LogInInterface $logIn,
    ) {
    }

    public function __invoke(
        LogInUserServiceCommand $logInUserServiceCommand,
    ): UserServiceLoggedIn {
        if ($logInUserServiceCommand->email === '') {
            throw new InvalidEmailException();
        }

        if ($logInUserServiceCommand->password === '') {
            throw new InvalidPasswordException();
        }

        return $this->logIn->logInWithEmail(
            $logInUserServiceCommand->email,
            $logInUserServiceCommand->password,
        );
    }
}
