<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Adapter;

use App\BottleInventory\Domain\Adapter\UserAdapterInterface;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Infrastructure\Security\Repository\UserRepositoryInterface;
use App\BottleInventory\Infrastructure\Security\Translator\UserTranslator;

final readonly class UserAdapter implements UserAdapterInterface
{
    public function __construct(
        private UserRepositoryInterface $userRepository,
    ) {
    }

    #[\Override]
    public function ofEmail(OwnerEmail $email): ?User
    {
        try {
            return UserTranslator::toUser(
                $this->userRepository->ofEmail($email->value())
            );
        } catch (\LogicException) {
            return null;
        }
    }
}
