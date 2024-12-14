<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Symfony\Security\Service;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\Service\GetUserAuthenticatedInterface;
use App\Security\Domain\ValueObject\UserEmail;
use EmpireDesAmis\SecurityAuthenticatorBundle\Security\Service\GetUserAuthenticatedService as EmpireDesAmisGetUserAuthenticatedService;

final readonly class GetUserAuthenticatedService implements GetUserAuthenticatedInterface
{
    public function __construct(
        private EmpireDesAmisGetUserAuthenticatedService $getUserAuthenticatedService,
        private UserRepositoryInterface $userRepository,
    ) {
    }

    #[\Override]
    public function getUser(): User
    {
        $user = $this->getUserAuthenticatedService->getUser();

        return new User(
            $this->userRepository->nextIdentity(),
            UserEmail::fromString($user->email),
        );
    }
}
