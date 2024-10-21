<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Adapter\BottleListAdapterInterface;
use App\BottleInventory\Application\Projection\CreateBottleListProjection;
use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Event\BottleCreated;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleCountry;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleGrapeVarieties;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottleOwnerId;
use App\BottleInventory\Domain\ValueObject\BottlePrice;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use Doctrine\ODM\MongoDB\DocumentManager;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateBottleListProjectionTest extends KernelTestCase
{
    private readonly CreateBottleListProjection $bottleListProjection;
    private readonly BottleListAdapterInterface $bottleListAdapter;
    private readonly BottleRepositoryInterface $bottleRepository;
    private readonly DocumentManager $documentManager;

    public function testBottleProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->bottleListProjection = $container->get(CreateBottleListProjection::class);
        $this->bottleListAdapter = $container->get(BottleListAdapterInterface::class);
        $this->bottleRepository = $container->get(BottleRepositoryInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);

        $bottleEntity = Bottle::create(
            BottleId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('hugues.gobet@gmail.com'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
        $bottleEntity::eraseRecordedEvents();

        $this->bottleRepository->add($bottleEntity);

        $event = new BottleCreated(
            '4ad98deb-4295-455d-99e2-66e148c162af',
        );

        $projection($event);

        $bottle = $this->bottleListAdapter->ofId('4ad98deb-4295-455d-99e2-66e148c162af');
        $this->assertNotNull($bottle);

        $this->documentManager->remove($bottle);
        $this->documentManager->flush();

        $bottleEntity = $this->bottleRepository->ofId(
            BottleId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
        );
        $this->bottleRepository->delete($bottleEntity);
    }
}
