<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\BottleInventory\Http\Client;

interface BottleInventoryHttpClientInterface
{
    public const BOTTLE_URI = '/api/bottles';
    public const USER_LOGIN_URI = '/api/users/login';
    public const AUTHORITY_PROVIDER_FIREBASE = 'firebase.com';

    public function ofId(string $id): array;
}
