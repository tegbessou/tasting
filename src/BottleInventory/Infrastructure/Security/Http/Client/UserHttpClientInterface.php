<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Http\Client;

interface UserHttpClientInterface
{
    public const USER_URI = '/api/users';
    public const HEADER_IDENTITY_PROVIDER = 'RequestHeaderIdentityProvider';

    public function ofEmail(string $email): array;
}
