<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\BottleInventory\Infrastructure\Doctrine\Repository\OwnerReadDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class OwnerReadDoctrineRepositoryTest extends KernelTestCase
{
    private OwnerReadDoctrineRepository $doctrineOwnerRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineOwnerRepository = $container->get(OwnerReadDoctrineRepository::class);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineOwnerRepository->ofId(OwnerId::fromString('be6d32dc-2313-4dbf-8c66-6807d1335bbc')),
        );
    }

    public function testOfEmail(): void
    {
        $this->assertNotNull(
            $this->doctrineOwnerRepository->ofEmail(OwnerEmail::fromString('hugues.gobet@gmail.com')),
        );
    }

    public function testExist(): void
    {
        $this->assertTrue(
            $this->doctrineOwnerRepository->exist(OwnerId::fromString('be6d32dc-2313-4dbf-8c66-6807d1335bbc')),
        );
    }
}
