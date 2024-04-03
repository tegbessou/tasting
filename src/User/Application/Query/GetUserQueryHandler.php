<?php

declare(strict_types=1);

namespace App\User\Application\Query;

use App\Shared\Application\Query\AsQueryHandler;
use App\User\Domain\Entity\User;
use App\User\Domain\Exception\UserNotFoundException;
use App\User\Domain\Repository\UserReadRepositoryInterface;

#[AsQueryHandler]
final readonly class GetUserQueryHandler
{
    public function __construct(
        private UserReadRepositoryInterface $userReadRepository,
    ) {
    }

    /**
     * @throws UserNotFoundException
     */
    public function __invoke(GetUserQuery $getUserQuery): User
    {
        $user = $this->userReadRepository->ofEmail($getUserQuery->email);

        if ($user === null) {
            throw new UserNotFoundException();
        }

        return $user;
    }
}
