<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Exception\UserAlreadyExistsException;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

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
    public function __invoke(CreateUserCommand $createUserCommand): UserEmail
    {
        if ($this->userRepository->ofEmail(UserEmail::fromString($createUserCommand->email)) !== null) {
            throw new UserAlreadyExistsException($createUserCommand->email);
        }

        $user = User::create(
            $this->userRepository->nextIdentity(),
            UserEmail::fromString($createUserCommand->email),
        );

        $this->userRepository->add($user);

        $this->dispatcher->dispatch($user);

        return $user->email();
    }
}
