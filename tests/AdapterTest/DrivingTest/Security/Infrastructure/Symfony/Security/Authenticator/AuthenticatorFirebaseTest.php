<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Security\Infrastructure\Symfony\Security\Authenticator;

use Shared\ApiTestCase;

final class AuthenticatorFirebaseTest extends ApiTestCase
{
    public function testAuthenticateWithApple(): void
    {
        $this->get('/api/countries');

        $this->assertResponseStatusCodeSame(200);
    }

    public function testAuthenticateWithGoogle(): void
    {
        $this->get('/api/countries', [], 'google');

        $this->assertResponseStatusCodeSame(200);
    }
}
