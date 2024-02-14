<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\User\Infrastructure\ApiPlatform\State\Processor;

use App\Tests\Shared\ApiTestCase;

final class CreateUserProcessorTest extends ApiTestCase
{
    public function testCreateUser(): void
    {
        $this->post('/api/users', [
            'email' => 'new-user@gmail.com',
        ]);

        $this->assertResponseStatusCodeSame(204);
    }

    public function testCreateUserEmailAlreadyExist(): void
    {
        $this->post('/api/users', [
            'email' => 'hugues.gobet@gmail.com',
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
        $this->post('/api/users', []);

        $this->assertResponseStatusCodeSame(422);
        $this->assertJsonContains([
            '@type' => 'ConstraintViolationList',
            'hydra:title' => 'An error occurred',
            'hydra:description' => 'email: This value should not be blank.',
        ]);
    }
}
