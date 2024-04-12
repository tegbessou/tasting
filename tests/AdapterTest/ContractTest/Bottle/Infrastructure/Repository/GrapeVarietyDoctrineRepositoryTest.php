<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Bottle\Infrastructure\Repository;

use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use App\Bottle\Infrastructure\Doctrine\Repository\GrapeVarietyDoctrineReadRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class GrapeVarietyDoctrineRepositoryTest extends KernelTestCase
{
    private GrapeVarietyDoctrineReadRepository $doctrineGrapeVarietyRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineGrapeVarietyRepository = $container->get(GrapeVarietyDoctrineReadRepository::class);
    }

    public function testExist(): void
    {
        $this->assertTrue(
            $this->doctrineGrapeVarietyRepository->exist(GrapeVarietyName::fromString('Grenache')),
        );
    }

    public function testNotExist(): void
    {
        $this->assertFalse(
            $this->doctrineGrapeVarietyRepository->exist(GrapeVarietyName::fromString('Négrette')),
        );
    }
}
