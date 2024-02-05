<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\User\Symfony\Security\Authenticator;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;

final class FirebaseAuthenticatorTest extends ApiTestCase
{
    public function testAuthenticateWithApple(): void
    {
        $client = static::createClient();

        $client->request('GET', '/api/countries', [
            'json' => [
                'email' => 'hugues.gobet@gmail.com',
            ],
            'headers' => [
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
                'Content-Type' => 'application/ld+json',
            ],
        ]);

        $this->assertResponseStatusCodeSame(200);
    }

    public function testAuthenticateWithGoogle(): void
    {
        $client = static::createClient();

        $client->request('GET', '/api/countries', [
            'json' => [
                'email' => 'hugues.gobet@gmail.com',
            ],
            'headers' => [
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'google.com',
                'Content-Type' => 'application/ld+json',
            ],
        ]);

        $this->assertResponseStatusCodeSame(200);
    }
}
