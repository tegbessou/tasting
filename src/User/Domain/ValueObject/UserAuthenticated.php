<?php

declare(strict_types=1);

namespace App\User\Domain\ValueObject;

final readonly class UserAuthenticated
{
    private Email $email;

    public function __construct(
        string $email,
    ) {
        $this->email = new Email($email);
    }

    public function email(): Email
    {
        return $this->email;
    }
}
