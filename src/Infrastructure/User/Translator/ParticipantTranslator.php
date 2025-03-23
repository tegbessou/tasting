<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\User\Translator;

use EmpireDesAmis\Tasting\Domain\ValueObject\User;
use EmpireDesAmis\Tasting\Domain\ValueObject\UserEmail;
use EmpireDesAmis\Tasting\Domain\ValueObject\UserFullName;
use EmpireDesAmis\Tasting\Infrastructure\User\Exception\ParticipantDoesntExistYetException;

final class ParticipantTranslator
{
    public static function toUser(array $data): User
    {
        if ($data === []) {
            throw new ParticipantDoesntExistYetException();
        }

        return User::create(
            UserEmail::fromString($data['email']),
            // Todo change this
            UserFullName::fromString('Pedro'),
        );
    }
}
