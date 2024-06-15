<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Security\Infrastructure\ApiPlatform\State\Processor;

use App\Security\Domain\Entity\User;
use App\Security\Infrastructure\Symfony\Messenger\Message\UserCreatedMessage;
use App\Tests\Shared\ApiTestCase;
use Doctrine\ORM\EntityManagerInterface;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateUserProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;

    private EntityManagerInterface $entityManager;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->entityManager = $container->get(EntityManagerInterface::class);

        parent::setUp();
    }

    public function testCreateUser(): void
    {
        $this->transport('security')->queue()->assertEmpty();

        $this->post('/api/users', [
            'email' => 'new-user@gmail.com',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->transport('security')->queue()->assertContains(UserCreatedMessage::class, 1);

        $user = $this->entityManager->getRepository(User::class)->findOneBy([
            'email.value' => 'new-user@gmail.com',
        ]);

        $this->entityManager->remove($user);
        $this->entityManager->flush();
    }

    /**
     * @dataProvider provideInvalidData
     */
    public function testCreateUserWithInvalidData(
        array $payload,
        int $statusCode,
        array $violations,
    ): void {
        $this->post('/api/users', $payload);

        $this->assertResponseStatusCodeSame($statusCode);
        $this->assertJsonContains($violations);
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'Email already exist' => [
            'payload' => [
                'email' => 'hugues.gobet@gmail.com',
            ],
            'statusCode' => 422,
            'violations' => [
                '@type' => 'ConstraintViolationList',
                'hydra:title' => 'An error occurred',
                'hydra:description' => 'email: User with email hugues.gobet@gmail.com already exists.',
            ],
        ];

        yield 'No email' => [
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                '@type' => 'ConstraintViolationList',
                'hydra:title' => 'An error occurred',
                'hydra:description' => 'email: This value should not be blank.',
            ],
        ];
    }
}
