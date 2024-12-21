<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TastingDoctrineRepositoryTest extends KernelTestCase
{
    use RefreshDatabase;

    private TastingRepositoryInterface $doctrineTastingRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineTastingRepository = $container->get(TastingRepositoryInterface::class);

        parent::setUp();
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineTastingRepository->ofId(
                TastingId::fromString(
                    '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'
                ),
            ),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineTastingRepository->ofId(
                TastingId::fromString(
                    '41574f57-f5af-4e0c-bde7-49bb2f161e33'
                ),
            ),
        );
    }

    public function testAdd(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('0d022ae1-7129-49c2-b0a4-ed8b8612715f'),
            Bottle::create(
                'Château Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->doctrineTastingRepository->add($tasting);

        $tasting = $this->doctrineTastingRepository->ofId(
            TastingId::fromString('0d022ae1-7129-49c2-b0a4-ed8b8612715f'),
        );

        $this->assertNotNull($tasting);

        $this->assertEquals(
            'Château Margaux 2015',
            $tasting->bottle()->name(),
        );

        $this->assertEquals(
            'red',
            $tasting->bottle()->wineType()->value,
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $tasting->ownerId()->value(),
        );
    }

    public function testNextIdentity(): void
    {
        $this->assertIsString(
            $this->doctrineTastingRepository->nextIdentity()->value(),
        );
    }
}
