<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\User\Infrastructure\Doctrine\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use App\User\Infrastructure\Doctrine\Repository\UserDoctrineWriteRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserWriteDoctrineRepositoryTest extends KernelTestCase
{
    private UserDoctrineWriteRepository $doctrineUserWriteRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineUserWriteRepository = $container->get(UserDoctrineWriteRepository::class);
    }

    public function testOfEmail(): void
    {
        $user = $this->doctrineUserWriteRepository->ofEmail(UserEmail::fromString('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineUserWriteRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testAddUser(): void
    {
        $user = User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            UserEmail::fromString('pedro@gmail.com'),
        );

        $this->doctrineUserWriteRepository->add($user);

        $user = $this->doctrineUserWriteRepository->ofEmail(UserEmail::fromString('pedro@gmail.com'));

        $this->assertNotNull($user);

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($user);
        $entityManager->flush();
    }
}
