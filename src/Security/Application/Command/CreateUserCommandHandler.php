<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Exception\UserAlreadyExistsException;
use App\Security\Domain\Repository\UserWriteRepositoryInterface;
use App\Shared\Application\Command\AsCommandHandler;

#[AsCommandHandler]
final readonly class CreateUserCommandHandler
{
    public function __construct(
        private UserWriteRepositoryInterface $userWriteRepository,
    ) {
    }

    /**
     * @throws UserAlreadyExistsException
     */
    public function __invoke(CreateUserCommand $createUserCommand): void
    {
        if ($this->userWriteRepository->ofEmail($createUserCommand->email) !== null) {
            throw new UserAlreadyExistsException();
        }

        $user = User::create(
            $this->userWriteRepository->nextIdentity(),
            $createUserCommand->email,
        );

        $this->userWriteRepository->add($user);
    }
}
