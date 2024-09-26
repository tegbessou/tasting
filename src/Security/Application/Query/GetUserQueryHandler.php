<?php

declare(strict_types=1);

namespace App\Security\Application\Query;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Exception\UserNotFoundException;
use App\Security\Domain\Repository\UserRepositoryInterface;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetUserQueryHandler
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
    ) {
    }

    /**
     * @throws UserNotFoundException
     */
    public function __invoke(GetUserQuery $getUserQuery): User
    {
        $user = $this->userRepository->ofEmail($getUserQuery->email);

        if ($user === null) {
            throw new UserNotFoundException();
        }

        return $user;
    }
}
