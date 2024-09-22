<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Security\Infrastructure\ApiPlatform\State\Processor;

use App\Security\Domain\Entity\User;
use App\Security\Infrastructure\Symfony\Messenger\Message\UserCreatedMessage;
use App\Tests\Shared\ApiTestCase;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Framework\Attributes\DataProvider;
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
        $this->transport('security_to_bottle_inventory')->queue()->assertEmpty();

        $this->post('/api/users', [
            'email' => 'new-user@gmail.com',
        ]);

        $this->assertResponseStatusCodeSame(201);
        $this->assertJsonContains([
            '@context' => '/api/contexts/User',
            '@type' => 'User',
            'email' => 'new-user@gmail.com',
        ]);

        $this->transport('security_to_bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('security_to_tasting')->queue()->assertContains(UserCreatedMessage::class, 1);

        $user = $this->entityManager->getRepository(User::class)->findOneBy([
            'email.value' => 'new-user@gmail.com',
        ]);

        $this->entityManager->remove($user);
        $this->entityManager->flush();
    }

    #[DataProvider('provideInvalidData')]
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
                'hydra:description' => 'email: L\'utilisateur avec l\'email hugues.gobet@gmail.com existe déjà.',
            ],
        ];

        yield 'No email' => [
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                '@type' => 'ConstraintViolationList',
                'hydra:title' => 'An error occurred',
                'hydra:description' => 'email: Cette valeur ne doit pas être vide.',
            ],
        ];
    }
}
