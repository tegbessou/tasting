<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Security\Infrastructure\Doctrine\Repository;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserDoctrineRepositoryTest extends KernelTestCase
{
    private EntityManagerInterface $entityManager;

    private UserRepositoryInterface $doctrineUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineUserRepository = $container->get(UserRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->beginTransaction();
    }

    #[\Override]
    protected function tearDown(): void
    {
        $this->entityManager->rollback();

        parent::tearDown();
    }

    public function testOfEmail(): void
    {
        $user = $this->doctrineUserRepository->ofEmail(UserEmail::fromString('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }

    public function testOfEmailNull(): void
    {
        $user = $this->doctrineUserRepository->ofEmail(UserEmail::fromString('pedro@gmail.com'));

        $this->assertNull($user);
    }

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineUserRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testAddUser(): void
    {
        $user = User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            UserEmail::fromString('pedro@gmail.com'),
        );

        $this->doctrineUserRepository->add($user);

        $user = $this->doctrineUserRepository->ofEmail(UserEmail::fromString('pedro@gmail.com'));

        $this->assertNotNull($user);

        $user::eraseRecordedEvents();
    }
}
