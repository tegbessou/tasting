<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Security\Translator;

use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Domain\ValueObject\UserEmail;

final class UserTranslator
{
    public static function toUser(array $data): User
    {
        if ($data === []) {
            throw new \LogicException();
        }

        return User::create(
            UserEmail::fromString($data['email']),
            $data['isCurrent'],
        );
    }
}
