<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Country\Infrastructure\Doctrine\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use App\Country\Infrastructure\Doctrine\Repository\CountryWriteDoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryWriteDoctrineRepositoryTest extends KernelTestCase
{
    private EntityManagerInterface $entityManager;
    private CountryWriteDoctrineRepository $doctrineCountryWriteRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineCountryWriteRepository = $container->get(CountryWriteDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->getConnection()->setNestTransactionsWithSavepoints(true);
        $this->entityManager->beginTransaction();

        parent::setUp();
    }

    #[\Override]
    protected function tearDown(): void
    {
        $this->entityManager->rollback();

        parent::tearDown();
    }

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineCountryWriteRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testAdd(): void
    {
        $country = new Country(
            CountryId::fromString('10ce4cd1-33a1-4cb1-a90b-6d30ff23b0d6'),
            CountryName::fromString('France2'),
        );
        $this->doctrineCountryWriteRepository->add($country);

        $country = $this->doctrineCountryWriteRepository->ofName(CountryName::fromString('France2'));

        $this->assertNotNull($country);

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($country);
        $entityManager->flush();
    }
}
