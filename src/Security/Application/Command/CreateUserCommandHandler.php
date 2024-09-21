<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Exception\UserAlreadyExistsException;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateUserCommandHandler
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    /**
     * @throws UserAlreadyExistsException
     */
    public function __invoke(CreateUserCommand $createUserCommand): void
    {
        if ($this->userRepository->ofEmail($createUserCommand->email) !== null) {
            throw new UserAlreadyExistsException();
        }

        $user = User::create(
            $this->userRepository->nextIdentity(),
            $createUserCommand->email,
        );

        $this->dispatcher->dispatch($user);

        $this->userRepository->add($user);
    }
}
