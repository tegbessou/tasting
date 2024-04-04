<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\User\Infrastructure\Doctrine\Repository;

use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use App\User\Infrastructure\Doctrine\Repository\UserDoctrineReadRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserReadDoctrineRepositoryTest extends KernelTestCase
{
    private UserDoctrineReadRepository $doctrineUserReadRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineUserReadRepository = $container->get(UserDoctrineReadRepository::class);
    }

    public function testOfEmail(): void
    {
        $user = $this->doctrineUserReadRepository->ofEmail(UserEmail::fromString('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }

    public function testOfId(): void
    {
        $user = $this->doctrineUserReadRepository->ofId(UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'));

        $this->assertNotNull($user);
    }

    public function testExistWithId(): void
    {
        $this->assertTrue(
            $this->doctrineUserReadRepository->existWithId(UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'))
        );
    }

    public function testNotExistWithId(): void
    {
        $this->assertFalse(
            $this->doctrineUserReadRepository->existWithId(UserId::fromString('e90cd120-7b3b-41dc-b369-8055065f648c'))
        );
    }
}
