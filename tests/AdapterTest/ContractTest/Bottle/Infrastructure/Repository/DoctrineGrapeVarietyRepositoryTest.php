<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Bottle\Infrastructure\Repository;

use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use App\Bottle\Infrastructure\Doctrine\Repository\DoctrineGrapeVarietyRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DoctrineGrapeVarietyRepositoryTest extends KernelTestCase
{
    private DoctrineGrapeVarietyRepository $doctrineGrapeVarietyRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineGrapeVarietyRepository = $container->get(DoctrineGrapeVarietyRepository::class);
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
