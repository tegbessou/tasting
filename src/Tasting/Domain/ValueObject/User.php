<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

final readonly class User
{
    public function __construct(
        private UserEmail $email,
        private bool $current,
    ) {
    }

    public static function create(
        UserEmail $email,
        bool $isCurrent,
    ): self {
        return new self(
            $email,
            $isCurrent,
        );
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
