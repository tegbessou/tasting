<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingReadDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TastingReadDoctrineRepositoryTest extends KernelTestCase
{
    private TastingReadDoctrineRepository $doctrineTastingRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingReadDoctrineRepository::class);
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

    public function testWithBottle(): void
    {
        $tastings = $this->doctrineTastingRepository->withBottle(
            BottleId::fromString('5ec0917b-179f-46e4-87d6-db76fbddf45f'),
        )->getIterator();

        $this->assertNotNull($tastings->current());
        $this->assertStringContainsString('9964e539-05ff-4611-b39c-ffd6d108b8b7', $tastings->current()->owner()->id()->id());
    }
}
