<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Http\Client;

interface UserHttpClientInterface
{
    public const USER_URI = '/api/users';
    public const USER_LOGIN_URI = '/api/users/login';
    public const AUTHORITY_PROVIDER_FIREBASE = 'firebase.com';

    public function ofEmail(string $email): array;
}
