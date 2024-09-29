<?php

declare(strict_types=1);

namespace App\Security\Application\Query;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\Service\GetUserAuthenticatedInterface;
use App\Security\Domain\ValueObject\UserIsCurrent;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetUserIsCurrentQueryHandler
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
        private GetUserAuthenticatedInterface $getUserAuthenticated,
    ) {
    }

    public function __invoke(GetUserIsCurrentQuery $getUserIsCurrentQuery): ?UserIsCurrent
    {
        $user = $this->userRepository->ofEmail($getUserIsCurrentQuery->email);

        if ($user === null) {
            return null;
        }

        return UserIsCurrent::create(
            $user->email(),
            $this->isCurrentOrService($user),
        );
    }

    private function isCurrentOrService(
        User $user,
    ): bool {
        return $this->getUserAuthenticated->getUser()->email()->equals($user->email())
            || str_contains($this->getUserAuthenticated->getUser()->email()->value(), 'services')
        ;
    }
}
