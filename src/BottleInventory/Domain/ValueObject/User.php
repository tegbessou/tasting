<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\ValueObject;

final readonly class User
{
    public function __construct(
        private UserEmail $email,
        private bool $currentUser,
    ) {
    }

    public static function create(UserEmail $email, bool $isCurrentEmail): self
    {
        return new self($email, $isCurrentEmail);
    }

    public function email(): UserEmail
    {
        return $this->email;
    }

    public function isCurrentUser(): bool
    {
        return $this->currentUser;
    }
}
