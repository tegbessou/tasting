<?php

declare(strict_types=1);

namespace App\Security\Application\Query;

use App\Security\Application\Adapter\UserAdapterInterface;
use App\Security\Application\ReadModel\User;
use App\Security\Domain\Service\GetUserAuthenticatedInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserIsCurrent;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetUserIsCurrentQueryHandler
{
    public function __construct(
        private UserAdapterInterface $userAdapter,
        private GetUserAuthenticatedInterface $getUserAuthenticated,
    ) {
    }

    public function __invoke(GetUserIsCurrentQuery $getUserIsCurrentQuery): ?UserIsCurrent
    {
        $user = $this->userAdapter->ofId($getUserIsCurrentQuery->email);

        if ($user === null) {
            return null;
        }

        return UserIsCurrent::create(
            UserEmail::fromString($user->email),
            $this->isCurrentOrService($user),
        );
    }

    private function isCurrentOrService(
        User $user,
    ): bool {
        return $this->getUserAuthenticated->getUser()->email()->equals(UserEmail::fromString($user->email))
            || str_contains($this->getUserAuthenticated->getUser()->email()->value(), 'services')
        ;
    }
}
