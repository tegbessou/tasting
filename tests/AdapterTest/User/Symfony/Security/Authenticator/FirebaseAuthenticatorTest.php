<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\User\Symfony\Security\Authenticator;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class FirebaseAuthenticatorTest extends WebTestCase
{
    public function testAuthenticateWithApple(): void
    {
        $client = static::createClient();

        $headers = [
            'HTTP_AUTHORIZATION' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
            'HTTP_ACCEPT' => 'application/json',
            'RequestHeaderIdentityProvider' => 'apple.com',
        ];

        $client->request('GET', '/api/bottle', [], [], $headers);

        $response = $client->getResponse();

        $this->assertNotEquals(401, $response->getStatusCode());
    }

    public function testAuthenticateWithGoogle(): void
    {
        $client = static::createClient();

        $headers = [
            'HTTP_AUTHORIZATION' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
            'HTTP_ACCEPT' => 'application/json',
            'RequestHeaderIdentityProvider' => 'google.com',
        ];

        $client->request('GET', '/api/bottle', [], [], $headers);

        $response = $client->getResponse();

        $this->assertNotEquals(401, $response->getStatusCode());
    }
}
