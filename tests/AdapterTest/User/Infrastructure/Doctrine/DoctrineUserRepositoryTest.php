<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\User\Infrastructure\Doctrine;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\Email;
use App\User\Domain\ValueObject\UserId;
use App\User\Infrastructure\Doctrine\DoctrineUserRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class DoctrineUserRepositoryTest extends KernelTestCase
{
    public function testFindByEmail(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $user = $doctrineUserRepository->findByEmail(new Email('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }

    public function testIsAlreadyExist(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $this->assertTrue(
            $doctrineUserRepository->isAlreadyExist(new Email('hugues.gobet@gmail.com'))
        );
    }

    public function testIsNotAlreadyExist(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $this->assertFalse(
            $doctrineUserRepository->isAlreadyExist(new Email('pedro@gmail.com'))
        );
    }

    public function testNextIdentity(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $nextIdentity = $doctrineUserRepository->nextIdentity();

        $this->assertIsString($nextIdentity->id());
    }

    public function testAddUser(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $user = User::create(
            new UserId('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            new Email('pedro@gmail.com'),
        );

        $doctrineUserRepository->add($user);

        $user = $doctrineUserRepository->findByEmail(new Email('pedro@gmail.com'));

        $this->assertNotNull($user);
    }
}
