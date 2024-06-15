<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Http\Client;

final readonly class UserFakeHttpClient implements UserHttpClientInterface
{
    #[\Override]
    public function ofEmail(string $email): array
    {
        if ($email === 'hugues.gobet@gmail.com') {
            return [
                'email' => 'hugues.gobet@gmail.com',
                'isCurrentUser' => true,
            ];
        }

        if ($email === 'root@gmail.com') {
            return [
                'email' => 'not.current.user@gmail.com',
                'isCurrentUser' => false,
            ];
        }

        return [];
    }
}
