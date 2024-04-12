<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\User\Infrastructure\ApiPlatform\State\Processor;

use App\Tests\Shared\ApiTestCase;
use App\User\Domain\Entity\User;
use Doctrine\ORM\EntityManagerInterface;

final class CreateUserProcessorTest extends ApiTestCase
{
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
        $this->post('/api/users', [
            'email' => 'new-user@gmail.com',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $user = $this->entityManager->getRepository(User::class)->findOneBy([
            'email.value' => 'new-user@gmail.com',
        ]);
        $this->entityManager->remove($user);
        $this->entityManager->flush();
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
