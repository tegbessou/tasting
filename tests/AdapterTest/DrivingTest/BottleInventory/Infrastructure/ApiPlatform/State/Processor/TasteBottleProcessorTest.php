<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\BottleInventory\Infrastructure\ApiPlatform\State\Processor;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleCountry;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleGrapeVarieties;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottlePrice;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use App\BottleInventory\Infrastructure\Symfony\Messenger\Message\BottleTastedMessage;
use App\Tests\Shared\ApiTestCase;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Framework\Attributes\DataProvider;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class TasteBottleProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;

    private BottleRepositoryInterface $doctrineBottleRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->doctrineBottleRepository = $container->get(BottleRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        parent::setUp();
    }

    public function testTasteBottle(): void
    {
        $owner = $this->entityManager
            ->getRepository(Owner::class)
            ->find('be6d32dc-2313-4dbf-8c66-6807d1335bbc')
        ;

        $bottle = Bottle::create(
            BottleId::fromString('72dcf99e-823e-4c0b-b841-49175a1e68e5'),
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
        $this->transport('bottle_inventory_to_tasting')->queue()->assertEmpty();

        $this->post('/api/bottles/72dcf99e-823e-4c0b-b841-49175a1e68e5/taste');

        $bottle = $this->doctrineBottleRepository->ofId(
            BottleId::fromString('72dcf99e-823e-4c0b-b841-49175a1e68e5')
        );

        $this->assertResponseStatusCodeSame(204);
        $this->assertNotNull($bottle->tastedAt());

        $this->transport('bottle_inventory_to_tasting')->queue()->assertContains(BottleTastedMessage::class, 1);

        $this->doctrineBottleRepository->delete($bottle);
    }

    #[DataProvider('provideInvalidData')]
    public function testTasteBottleWithInvalidData(
        string $id,
        int $statusCode,
    ): void {
        $this->post(
            sprintf(
                '/api/bottles/%s/taste',
                $id,
            ),
        );
        $this->assertResponseStatusCodeSame($statusCode);
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'Not found bottle' => [
            'id' => '430e1ce0-f5a6-4503-bb44-3b3bcc6a9e1c',
            'statusCode' => 404,
        ];

        yield 'BottleInventory not owned by user which try to taste it' => [
            'id' => '97102d4c-da46-4105-8c34-53f5a2e1e9fa',
            'statusCode' => 403,
        ];
    }
}
