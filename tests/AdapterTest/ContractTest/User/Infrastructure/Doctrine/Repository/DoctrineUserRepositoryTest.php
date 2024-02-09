<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\User\Infrastructure\Doctrine\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use App\User\Infrastructure\Doctrine\Repository\DoctrineUserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DoctrineUserRepositoryTest extends KernelTestCase
{
    private DoctrineUserRepository $doctrineUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineUserRepository = $container->get(DoctrineUserRepository::class);
    }

    public function testOfEmail(): void
    {
        $user = $this->doctrineUserRepository->ofEmail(UserEmail::fromString('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }

    public function testExistWithEmail(): void
    {
        $this->assertTrue(
            $this->doctrineUserRepository->existWithEmail(UserEmail::fromString('hugues.gobet@gmail.com'))
        );
    }

    public function testNotExistWithEmail(): void
    {
        $this->assertFalse(
            $this->doctrineUserRepository->existWithEmail(UserEmail::fromString('pedro@gmail.com'))
        );
    }

    public function testOfId(): void
    {
        $user = $this->doctrineUserRepository->ofId(UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'));

        $this->assertNotNull($user);
    }

    public function testExistWithId(): void
    {
        $this->assertTrue(
            $this->doctrineUserRepository->existWithId(UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'))
        );
    }

    public function testNotExistWithId(): void
    {
        $this->assertFalse(
            $this->doctrineUserRepository->existWithId(UserId::fromString('e90cd120-7b3b-41dc-b369-8055065f648c'))
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

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($user);
        $entityManager->flush();
    }
}
