<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\Resource;

use App\Security\Domain\ValueObject\UserServiceLoggedIn;

final readonly class AuthorizeTokenResource
{
    public function __construct(
        public string $token,
    ) {
    }

    public static function fromValue(
        UserServiceLoggedIn $userServiceLoggedIn,
    ): self {
        return new self(
            $userServiceLoggedIn->token()->token(),
        );
    }
}
