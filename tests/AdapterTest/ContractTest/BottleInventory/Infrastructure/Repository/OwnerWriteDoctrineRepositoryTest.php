<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\BottleInventory\Infrastructure\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerFullName;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\BottleInventory\Infrastructure\Doctrine\Repository\OwnerWriteDoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class OwnerWriteDoctrineRepositoryTest extends KernelTestCase
{
    private EntityManagerInterface $entityManager;

    private OwnerWriteDoctrineRepository $doctrineOwnerWriteRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineOwnerWriteRepository = $container->get(OwnerWriteDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->getConnection()->setNestTransactionsWithSavepoints(true);
        $this->entityManager->beginTransaction();

        parent::setUp();
    }

    #[\Override]
    protected function tearDown(): void
    {
        $this->entityManager->rollback();

        parent::tearDown();
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineOwnerWriteRepository->ofId(
                OwnerId::fromString('be6d32dc-2313-4dbf-8c66-6807d1335bbc')
            ),
        );
    }

    public function testAddWithAllInformation(): void
    {
        $owner = Owner::create(
            OwnerId::fromString('7e2d9640-0a56-4860-bbf2-21ed1fd8f592'),
            OwnerEmail::fromString('pedro@gmail.com'),
            OwnerFullName::fromString('Pedro Juarez'),
        );

        $this->doctrineOwnerWriteRepository->add($owner);

        $owner::eraseRecordedEvents();

        $this->assertNotNull(
            $this->doctrineOwnerWriteRepository->ofId(OwnerId::fromString('7e2d9640-0a56-4860-bbf2-21ed1fd8f592')),
        );
        $this->assertEquals(
            '7e2d9640-0a56-4860-bbf2-21ed1fd8f592', $owner->id()->value(),
        );
        $this->assertEquals(
            'pedro@gmail.com', $owner->email()->value(),
        );
        $this->assertEquals(
            'Pedro Juarez', $owner->fullName()->value(),
        );

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($owner);
        $entityManager->flush();
    }

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineOwnerWriteRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }
}
