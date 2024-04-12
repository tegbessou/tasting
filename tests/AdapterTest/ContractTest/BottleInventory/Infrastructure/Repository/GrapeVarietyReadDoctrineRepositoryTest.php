<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\BottleInventory\Infrastructure\Repository;

use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;
use App\BottleInventory\Infrastructure\Doctrine\Repository\GrapeVarietyDoctrineReadRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class GrapeVarietyReadDoctrineRepositoryTest extends KernelTestCase
{
    private GrapeVarietyDoctrineReadRepository $doctrineGrapeVarietyReadRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineGrapeVarietyReadRepository = $container->get(GrapeVarietyDoctrineReadRepository::class);
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
