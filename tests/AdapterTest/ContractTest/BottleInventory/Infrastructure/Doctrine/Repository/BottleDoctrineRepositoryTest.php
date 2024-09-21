<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleCountry;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleGrapeVarieties;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottlePicture;
use App\BottleInventory\Domain\ValueObject\BottlePrice;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class BottleDoctrineRepositoryTest extends KernelTestCase
{
    private EntityManagerInterface $entityManager;

    private BottleRepositoryInterface $doctrineBottleRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineBottleRepository = $container->get(BottleRepositoryInterface::class);
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
            $this->doctrineBottleRepository->ofId(BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d')),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineBottleRepository->ofId(BottleId::fromString('4fd831f2-5717-43c1-88de-cdc93bb955c7')),
        );
    }

    public function testSortName(): void
    {
        $bottles = $this->doctrineBottleRepository->sortName()
            ->getIterator()
        ;

        $this->assertEquals('Caymus Vineyards Special Selection Cabernet Sauvignon', $bottles->current()->name()->value());
    }

    public function testWithName(): void
    {
        $bottles = $this->doctrineBottleRepository->withName(BottleName::fromString('Chateau'))
            ->getIterator()
        ;

        $this->assertNotNull($bottles->current());
        $this->assertStringContainsString('Château', $bottles->current()->name()->value());
    }

    public function testWithEstateName(): void
    {
        $bottles = $this->doctrineBottleRepository->withEstateName(BottleEstateName::fromString('Chateau'))
            ->getIterator()
        ;

        $this->assertNotNull($bottles->current());
        $this->assertStringContainsString('Château', $bottles->current()->estateName()->value());
    }

    public function testWithYear(): void
    {
        $bottles = $this->doctrineBottleRepository->withYear(BottleYear::fromInt(2011))
            ->getIterator()
        ;

        $this->assertNotNull($bottles->current());
        $this->assertEquals(2011, $bottles->current()->year()->value());
    }

    public function testWithRate(): void
    {
        $bottles = $this->doctrineBottleRepository->withRate(BottleRate::fromString('++'))
            ->getIterator()
        ;

        $this->assertNotNull($bottles->current());
        $this->assertEquals('++', $bottles->current()->rate()->value());
    }

    public function testWithWineType(): void
    {
        $bottles = $this->doctrineBottleRepository->withWineType(BottleWineType::fromString('white'))
            ->getIterator()
        ;

        $this->assertNotNull($bottles->current());
        $this->assertEquals('white', $bottles->current()->wineType()->value());
    }

    public function testAddWithAllInformation(): void
    {
        $owner = $this->entityManager
            ->getRepository(Owner::class)
            ->find('be6d32dc-2313-4dbf-8c66-6807d1335bbc')
        ;

        $bottle = Bottle::create(
            BottleId::fromString('2ccee98f-f2d2-4aaa-b059-7c38bb7e57cf'),
            BottleName::fromString('Château Rayas'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2015),
            BottleGrapeVarieties::fromArray(['Grenache']),
            BottleRate::fromString('+'),
            $owner,
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(129.99),
        );

        $this->doctrineBottleRepository->add($bottle);

        $bottle::eraseRecordedEvents();

        $this->assertNotNull(
            $this->doctrineBottleRepository->ofId(BottleId::fromString('2ccee98f-f2d2-4aaa-b059-7c38bb7e57cf')),
        );

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($bottle);
        $entityManager->flush();
    }

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineBottleRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testUpdate(): void
    {
        $bottle = $this->doctrineBottleRepository->ofId(
            BottleId::fromString('635e809c-aaaf-40df-8483-83cfbe2c5504')
        );

        $this->assertNull(
            $bottle->picture()->path(),
        );

        $bottle->addPicture(BottlePicture::fromString('picture.jpg'));
        $this->doctrineBottleRepository->update($bottle);

        $bottle::eraseRecordedEvents();

        $bottleUpdated = $this->doctrineBottleRepository->ofId(
            BottleId::fromString('635e809c-aaaf-40df-8483-83cfbe2c5504')
        );

        $this->assertNotNull(
            $bottleUpdated->picture(),
        );
    }

    public function testDelete(): void
    {
        $owner = $this->entityManager
            ->getRepository(Owner::class)
            ->find('be6d32dc-2313-4dbf-8c66-6807d1335bbc')
        ;

        $bottle = Bottle::create(
            BottleId::fromString('9b676c71-3ad3-4c67-a464-aefef9f1940a'),
            BottleName::fromString('Mercurey 1er cru clos l\'évêque'),
            BottleEstateName::fromString('Maison Patriarche'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2018),
            BottleGrapeVarieties::fromArray(['Pinot Noir']),
            BottleRate::fromString('-'),
            $owner,
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(29.90),
        );

        $this->doctrineBottleRepository->add($bottle);

        $bottle::eraseRecordedEvents();

        $this->doctrineBottleRepository->delete($bottle);

        $bottleDeleted = $this->doctrineBottleRepository->ofId(
            BottleId::fromString('9b676c71-3ad3-4c67-a464-aefef9f1940a')
        );

        $this->assertNull(
            $bottleDeleted,
        );
    }
}
