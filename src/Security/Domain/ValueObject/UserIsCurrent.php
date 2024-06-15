<?php

declare(strict_types=1);

namespace App\Security\Domain\ValueObject;

final readonly class UserIsCurrent
{
    public function __construct(
        private UserEmail $email,
        private bool $current,
    ) {
    }

    public function email(): UserEmail
    {
        return $this->email;
    }

    public function isCurrent(): bool
    {
        return $this->current;
    }
}
