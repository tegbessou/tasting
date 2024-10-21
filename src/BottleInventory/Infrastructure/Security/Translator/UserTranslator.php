<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Translator;

use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Domain\ValueObject\UserId;
use App\BottleInventory\Domain\ValueObject\UserName;

final class UserTranslator
{
    public static function toUser(array $data): User
    {
        if ($data === []) {
            throw new \LogicException();
        }

        return User::create(
            UserId::fromString($data['email']),
            UserName::fromString('Hoge Hoge'),
            $data['isCurrent'],
        );
    }
}
