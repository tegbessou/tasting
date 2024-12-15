<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

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
        return $this->logIn->logInWithEmail(
            $logInUserServiceCommand->email,
            $logInUserServiceCommand->password,
        );
    }
}
