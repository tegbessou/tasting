<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Service;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Repository\UserRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;

final readonly class AuthorizationService
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
    ) {
    }

    public function isCurrentUserOwnerOfTheBottle(
        Bottle $bottle,
    ): bool {
        $user = $this->userRepository->ofEmail($bottle->owner()->email());

        if ($user === null) {
            return false;
        }

        return $user->isCurrentUser()
            && $bottle->owner()->email()->value() === $user->email()->value()
        ;
    }

    public function isExistUser(
        OwnerEmail $ownerEmail,
    ): bool {
        return $this->userRepository->ofEmail($ownerEmail) !== null;
    }
}
