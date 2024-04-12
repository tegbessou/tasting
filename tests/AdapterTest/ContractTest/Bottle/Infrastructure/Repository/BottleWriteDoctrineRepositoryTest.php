<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Bottle\Infrastructure\Repository;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleOwnerId;
use App\Bottle\Domain\ValueObject\BottlePicture;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Bottle\Infrastructure\Doctrine\Repository\BottleWriteDoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class BottleWriteDoctrineRepositoryTest extends KernelTestCase
{
    private EntityManagerInterface $entityManager;

    private BottleWriteDoctrineRepository $doctrineBottleWriteRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineBottleWriteRepository = $container->get(BottleWriteDoctrineRepository::class);
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
            $this->doctrineBottleWriteRepository->ofId(BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d')),
        );
    }

    public function testAddWithAllInformation(): void
    {
        $bottle = Bottle::create(
            BottleId::fromString('2ccee98f-f2d2-4aaa-b059-7c38bb7e57cf'),
            BottleName::fromString('Château Rayas'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2015),
            BottleGrapeVarieties::fromArray(['Grenache']),
            BottleRate::fromString('+'),
            BottleOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(129.99),
        );

        $this->doctrineBottleWriteRepository->add($bottle);

        $this->assertNotNull(
            $this->doctrineBottleWriteRepository->ofId(BottleId::fromString('2ccee98f-f2d2-4aaa-b059-7c38bb7e57cf')),
        );

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($bottle);
        $entityManager->flush();
    }

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineBottleWriteRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testUpdate(): void
    {
        $bottle = $this->doctrineBottleWriteRepository->ofId(
            BottleId::fromString('635e809c-aaaf-40df-8483-83cfbe2c5504')
        );

        $this->assertNull(
            $bottle->picture()->path(),
        );

        $bottle->addPicture(BottlePicture::fromString('picture.jpg'));
        $this->doctrineBottleWriteRepository->update($bottle);

        $bottleUpdated = $this->doctrineBottleWriteRepository->ofId(
            BottleId::fromString('635e809c-aaaf-40df-8483-83cfbe2c5504')
        );

        $this->assertNotNull(
            $bottleUpdated->picture(),
        );
    }

    public function testDelete(): void
    {
        $bottle = Bottle::create(
            BottleId::fromString('9b676c71-3ad3-4c67-a464-aefef9f1940a'),
            BottleName::fromString('Mercurey 1er cru clos l\'évêque'),
            BottleEstateName::fromString('Maison Patriarche'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2018),
            BottleGrapeVarieties::fromArray(['Pinot Noir']),
            BottleRate::fromString('-'),
            BottleOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(29.90),
        );

        $this->doctrineBottleWriteRepository->add($bottle);

        $this->doctrineBottleWriteRepository->delete($bottle);

        $bottleDeleted = $this->doctrineBottleWriteRepository->ofId(
            BottleId::fromString('9b676c71-3ad3-4c67-a464-aefef9f1940a')
        );

        $this->assertNull(
            $bottleDeleted,
        );
    }
}
