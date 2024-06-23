<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Security\Infrastructure\ApiPlatform\State\Processor;

use App\Tests\Shared\ApiTestCase;

final class LoginUserProcessorTest extends ApiTestCase
{
    public function testLoginUser(): void
    {
        $this->post('/api/users/login', [
            'email' => 'hugues.gobet@gmail.com',
            'password' => 'root',
        ]);

        $this->assertResponseStatusCodeSame(201);
        $this->assertJsonContains([
            'token' => 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImYwOGU2ZTNmNzg4ZDYwMTk0MDA1ZGJiYzE5NDc0YmY5Mjg5ZDM5ZWEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcG9jL',
        ]);
    }

    /**
     * @dataProvider provideInvalidData
     */
    public function testLoginUserWithInvalidData(
        array $payload,
        int $statusCode,
        array $violations,
    ): void {
        $this->post('/api/users/login', $payload);

        $this->assertResponseStatusCodeSame($statusCode);
        $this->assertJsonContains($violations);
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'No data' => [
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                '@type' => 'ConstraintViolationList',
                'hydra:title' => 'An error occurred',
                'hydra:description' => 'email: This value should not be blank.
password: This value should not be blank.',
            ],
        ];

        yield 'Email not an email' => [
            'payload' => [
                'email' => 'hugues.gobet',
                'password' => 'root',
            ],
            'statusCode' => 422,
            'violations' => [
                '@type' => 'ConstraintViolationList',
                'hydra:title' => 'An error occurred',
                'hydra:description' => 'email: This value is not a valid email address.',
            ],
        ];
    }
}
