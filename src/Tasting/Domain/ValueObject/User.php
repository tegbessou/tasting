<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

final readonly class User
{
    public function __construct(
        private UserEmail $email,
        private ?UserFullName $fullName = null,
    ) {
    }

    public static function create(
        UserEmail $email,
        ?UserFullName $fullName = null,
    ): self {
        return new self(
            $email,
            $fullName,
        );
    }

    public function email(): UserEmail
    {
        return $this->email;
    }

    public function fullName(): ?UserFullName
    {
        return $this->fullName;
    }
}
