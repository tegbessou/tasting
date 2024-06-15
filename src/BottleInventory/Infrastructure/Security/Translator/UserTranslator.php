<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Translator;

use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Domain\ValueObject\UserEmail;

final class UserTranslator
{
    public function toUser(array $data): User
    {
        if ($data === []) {
            throw new \LogicException();
        }

        return User::create(
            UserEmail::fromString($data['email']),
            $data['isCurrentUser'],
        );
    }
}
