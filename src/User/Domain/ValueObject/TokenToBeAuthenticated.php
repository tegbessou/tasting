<?php

declare(strict_types=1);

namespace App\User\Domain\ValueObject;

final readonly class TokenToBeAuthenticated
{
    private string $token;

    public function __construct(
        string $token
    ) {
        $this->token = $token;
    }

    public function token(): string
    {
        return $this->token;
    }
}
