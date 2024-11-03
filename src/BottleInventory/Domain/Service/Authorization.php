<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Service;

use App\BottleInventory\Domain\Adapter\UserAdapterInterface;
use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\ValueObject\UserId;

final readonly class Authorization
{
    public function __construct(
        private UserAdapterInterface $userRepository,
    ) {
    }

    public function isCurrentUserOwnerOfTheBottle(
        Bottle $bottle,
    ): bool {
        $user = $this->userRepository->ofId(
            UserId::fromString(
                $bottle->ownerId()->value(),
            ),
        );

        if ($user === null) {
            return false;
        }

        return $user->isCurrentUser()
            && $bottle->ownerId()->value() === $user->id()->value()
        ;
    }
}
