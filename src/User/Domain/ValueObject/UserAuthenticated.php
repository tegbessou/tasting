<?php

declare(strict_types=1);

namespace App\User\Domain\ValueObject;

final readonly class UserAuthenticated
{
    private UserEmail $email;

    public function __construct(
        string $email,
    ) {
        $this->email = UserEmail::fromString($email);
    }

    public function email(): UserEmail
    {
        return $this->email;
    }
}
