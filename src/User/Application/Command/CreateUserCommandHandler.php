<?php

declare(strict_types=1);

namespace App\User\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\User\Domain\Entity\User;
use App\User\Domain\Exception\UserAlreadyExistsException;
use App\User\Domain\Repository\UserWriteRepositoryInterface;

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
