<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

final readonly class User
{
    public function __construct(
        private UserEmail $id,
        private ?UserFullName $fullName = null,
    ) {
    }

    public static function create(
        UserEmail $id,
        ?UserFullName $fullName = null,
    ): self {
        return new self(
            $id,
            $fullName,
        );
    }

    public function id(): UserEmail
    {
        return $this->id;
    }

    public function fullName(): ?UserFullName
    {
        return $this->fullName;
    }
}
