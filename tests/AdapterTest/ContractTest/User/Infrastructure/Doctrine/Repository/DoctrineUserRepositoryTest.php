<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\User\Infrastructure\Doctrine\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use App\User\Infrastructure\Doctrine\Repository\DoctrineUserRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DoctrineUserRepositoryTest extends KernelTestCase
{
    public function testFindByEmail(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $user = $doctrineUserRepository->ofEmail(UserEmail::fromString('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }

    public function testIsAlreadyExist(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $this->assertTrue(
            $doctrineUserRepository->exist(UserEmail::fromString('hugues.gobet@gmail.com'))
        );
    }

    public function testIsNotAlreadyExist(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $this->assertFalse(
            $doctrineUserRepository->exist(UserEmail::fromString('pedro@gmail.com'))
        );
    }

    public function testNextIdentity(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $nextIdentity = $doctrineUserRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testAddUser(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $user = User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            UserEmail::fromString('pedro@gmail.com'),
        );

        $doctrineUserRepository->add($user);

        $user = $doctrineUserRepository->ofEmail(UserEmail::fromString('pedro@gmail.com'));

        $this->assertNotNull($user);
    }
}
