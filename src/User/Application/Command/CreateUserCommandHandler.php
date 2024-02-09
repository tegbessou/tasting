<?php

declare(strict_types=1);

namespace App\User\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\User\Domain\Entity\User;
use App\User\Domain\Exception\UserAlreadyExistsException;
use App\User\Domain\Repository\UserRepositoryInterface;

#[AsCommandHandler]
final readonly class CreateUserCommandHandler
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
    ) {
    }

    public function __invoke(CreateUserCommand $createUserCommand): void
    {
        if ($this->userRepository->existWithEmail($createUserCommand->email)) {
            throw new UserAlreadyExistsException();
        }

        $user = User::create(
            $this->userRepository->nextIdentity(),
            $createUserCommand->email,
        );

        $this->userRepository->add($user);
    }
}
