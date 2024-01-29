<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ApiPlatform\State\Processor;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;

class CreateUserProcessorTest extends ApiTestCase
{
    public function testCreateUser(): void
    {
        $client = static::createClient();

        $client->request('POST', '/api/users', [
            'json' => [
                'email' => 'new-user@gmail.com',
            ],
            'headers' => [
                'Content-Type' => 'application/ld+json',
            ],
        ]);

        $this->assertResponseStatusCodeSame(204);
    }

    public function testCreateUserEmailAlreadyExist(): void
    {
        $client = static::createClient();

        $client->request('POST', '/api/users', [
            'json' => [
                'email' => 'hugues.gobet@gmail.com',
            ],
            'headers' => [
                'Content-Type' => 'application/ld+json',
            ],
        ]);

        $this->assertResponseStatusCodeSame(422);
        $this->assertJsonContains([
            '@type' => 'ConstraintViolationList',
            'hydra:title' => 'An error occurred',
            'hydra:description' => 'email: User with email hugues.gobet@gmail.com already exists.',
        ]);
    }

    public function testCreateUserNoEmail(): void
    {
        $client = static::createClient();

        $client->request('POST', '/api/users', [
            'json' => [],
            'headers' => [
                'Content-Type' => 'application/ld+json',
            ],
        ]);

        $this->assertResponseStatusCodeSame(422);
        $this->assertJsonContains([
            '@type' => 'ConstraintViolationList',
            'hydra:title' => 'An error occurred',
            'hydra:description' => 'email: This value should not be blank.',
        ]);
    }
}
