<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\User\Infrastructure\Symfony\Security\Authenticator;

use App\Tests\Shared\ApiTestCase;

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
