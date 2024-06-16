<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Service;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Repository\UserReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;

final readonly class AuthorizationService
{
    public function __construct(
        private UserReadRepositoryInterface $userReadRepository,
    ) {
    }

    public function isCurrentUserOwnerOfTheBottle(
        Bottle $bottle
    ): bool {
        $user = $this->userReadRepository->ofEmail($bottle->owner()->email());

        if ($user === null) {
            return false;
        }

        return $user->isCurrentUser()
            && $bottle->owner()->email()->value() === $user->email()->value()
        ;
    }

    public function isExistUser(
        OwnerEmail $ownerEmail
    ): bool {
        return $this->userReadRepository->ofEmail($ownerEmail) !== null;
    }
}
