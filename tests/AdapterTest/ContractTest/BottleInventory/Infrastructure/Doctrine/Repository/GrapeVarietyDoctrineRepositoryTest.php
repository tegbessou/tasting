<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\Repository\GrapeVarietyRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class GrapeVarietyDoctrineRepositoryTest extends KernelTestCase
{
    private GrapeVarietyRepositoryInterface $doctrineGrapeVarietyReadRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineGrapeVarietyReadRepository = $container->get(GrapeVarietyRepositoryInterface::class);
    }

    public function testExist(): void
    {
        $this->assertTrue(
            $this->doctrineGrapeVarietyReadRepository->exist(GrapeVarietyName::fromString('Grenache')),
        );
    }

    public function testNotExist(): void
    {
        $this->assertFalse(
            $this->doctrineGrapeVarietyReadRepository->exist(GrapeVarietyName::fromString('Négrette')),
        );
    }
}
