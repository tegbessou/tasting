<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Http\Repository;

use App\BottleInventory\Domain\Repository\UserReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Infrastructure\Security\Http\Client\UserHttpClientInterface;
use App\BottleInventory\Infrastructure\Security\Translator\UserTranslator;

final readonly class UserHttpReadRepository implements UserReadRepositoryInterface
{
    public function __construct(
        private UserHttpClientInterface $userHttpClient,
        private UserTranslator $userTranslator,
    ) {
    }

    #[\Override]
    public function ofEmail(OwnerEmail $email): ?User
    {
        try {
            return $this->userTranslator->toUser(
                $this->userHttpClient->ofEmail($email->value())
            );
        } catch (\LogicException) {
            return null;
        }
    }
}
