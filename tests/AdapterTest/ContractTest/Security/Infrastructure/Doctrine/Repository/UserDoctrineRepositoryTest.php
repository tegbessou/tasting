<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Security\Infrastructure\Doctrine\Repository;

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

        $this->entityManager->getConnection()->setNestTransactionsWithSavepoints(true);
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

    public function testOfId(): void
    {
        $user = $this->doctrineUserRepository->ofId(UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'));

        $this->assertNotNull($user);
    }

    public function testOfIdNull(): void
    {
        $user = $this->doctrineUserRepository->ofId(UserId::fromString('4fd831f2-5717-43c1-88de-cdc93bb955c7'));

        $this->assertNull($user);
    }

    public function testExist(): void
    {
        $this->assertTrue(
            $this->doctrineUserRepository->exist(UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'))
        );
    }

    public function testNotExist(): void
    {
        $this->assertFalse(
            $this->doctrineUserRepository->exist(UserId::fromString('e90cd120-7b3b-41dc-b369-8055065f648c'))
        );
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
