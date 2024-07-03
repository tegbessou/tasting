<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use App\BottleInventory\Infrastructure\Doctrine\Repository\BottleReadDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class BottleReadDoctrineRepositoryTest extends KernelTestCase
{
    private BottleReadDoctrineRepository $doctrineBottleRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineBottleRepository = $container->get(BottleReadDoctrineRepository::class);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineBottleRepository->ofId(BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d')),
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
}
