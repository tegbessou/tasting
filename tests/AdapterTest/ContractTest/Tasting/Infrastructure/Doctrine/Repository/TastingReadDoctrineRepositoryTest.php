<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\ValueObject\BottleId;
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

    public function testWithBottle(): void
    {
        $tastings = $this->doctrineTastingRepository->withBottle(
            BottleId::fromString('5ec0917b-179f-46e4-87d6-db76fbddf45f'),
        )->getIterator();

        $this->assertNotNull($tastings->current());
        $this->assertStringContainsString('9964e539-05ff-4611-b39c-ffd6d108b8b7', $tastings->current()->owner()->id()->id());
    }
}
