<?php

declare(strict_types=1);

namespace App\User\Application\Query;

use App\Shared\Application\Query\AsQueryHandler;
use App\User\Domain\Entity\User;
use App\User\Domain\Exception\UserNotFoundException;
use App\User\Domain\Repository\UserRepositoryInterface;

#[AsQueryHandler]
final readonly class GetUserQueryHandler
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
    ) {
    }

    public function __invoke(GetUserQuery $getUserQuery): User
    {
        $user = $this->userRepository->findByEmail($getUserQuery->email);

        if ($user === null) {
            throw new UserNotFoundException();
        }

        return $user;
    }
}
