<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Bottle\Infrastructure\Repository;

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
use App\Bottle\Infrastructure\Doctrine\Repository\DoctrineBottleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DoctrineBottleRepositoryTest extends KernelTestCase
{
    private DoctrineBottleRepository $doctrineBottleRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineBottleRepository = $container->get(DoctrineBottleRepository::class);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineBottleRepository->ofId(BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d')),
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
            BottlePicture::fromString('/images/bottle/chateau-rayas.webp'),
            BottleOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(129.99),
        );

        $this->doctrineBottleRepository->add($bottle);

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
}
