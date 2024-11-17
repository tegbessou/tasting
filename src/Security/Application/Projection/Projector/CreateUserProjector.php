<?php

declare(strict_types=1);

namespace App\Security\Application\Projection\Projector;

use App\Security\Application\Adapter\UserAdapterInterface;
use App\Security\Application\Exception\UserDoesntExistException;
use App\Security\Application\ReadModel\User;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;

final readonly class CreateUserProjector
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
        private UserAdapterInterface $userAdapter,
    ) {
    }

    public function project(
        string $id,
        string $email,
    ): void {
        $user = $this->userRepository->ofEmail(
            UserEmail::fromString($email),
        );

        if ($user === null) {
            throw new UserDoesntExistException($id);
        }

        $user = new User(
            $id,
            $email,
        );

        $this->userAdapter->add($user);
    }
}
