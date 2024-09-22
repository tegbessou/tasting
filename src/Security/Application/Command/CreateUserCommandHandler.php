<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Exception\UserAlreadyExistsException;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
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
        if ($this->userRepository->ofEmail(UserEmail::fromString($createUserCommand->email)) !== null) {
            throw new UserAlreadyExistsException($createUserCommand->email);
        }

        $user = User::create(
            $this->userRepository->nextIdentity(),
            UserEmail::fromString($createUserCommand->email),
        );

        $this->dispatcher->dispatch($user);

        $this->userRepository->add($user);
    }
}
