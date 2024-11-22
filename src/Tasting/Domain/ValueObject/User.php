<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

final readonly class User
{
    public function __construct(
        private UserEmail $email,
        private UserFullName $fullName,
        private bool $current,
    ) {
    }

    public static function create(
        UserEmail $email,
        bool $isCurrent,
    ): self {
        return new self(
            $email,
            UserFullName::fromString('Pedro'),
            $isCurrent,
        );
    }

    public function email(): UserEmail
    {
        return $this->email;
    }

    public function fullName(): UserFullName
    {
        return $this->fullName;
    }

    public function isCurrent(): bool
    {
        return $this->current;
    }
}
