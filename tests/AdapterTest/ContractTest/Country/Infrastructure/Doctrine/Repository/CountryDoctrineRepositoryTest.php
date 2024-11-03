<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Country\Infrastructure\Doctrine\Repository;

use App\Country\Domain\Repository\CountryRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryDoctrineRepositoryTest extends KernelTestCase
{
    private EntityManagerInterface $entityManager;
    private CountryRepositoryInterface $doctrineCountryRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineCountryRepository = $container->get(CountryRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->beginTransaction();

        parent::setUp();
    }

    #[\Override]
    protected function tearDown(): void
    {
        $this->entityManager->rollback();

        parent::tearDown();
    }

    public function testOfName(): void
    {
        $country = $this->doctrineCountryRepository->ofName(CountryName::fromString('France'));

        $this->assertNotNull($country);
        $this->assertEquals('France', $country->name()->value());
    }

    public function testOfNameNull(): void
    {
        $country = $this->doctrineCountryRepository->ofName(CountryName::fromString('Pedro'));

        $this->assertNull($country);
    }

    public function testExist(): void
    {
        $this->assertTrue($this->doctrineCountryRepository->exist(CountryName::fromString('France')));
    }

    public function testWithName(): void
    {
        $doctrineCountryRepository = $this->doctrineCountryRepository->withName(CountryName::fromString('France'));

        $countries = $doctrineCountryRepository->getIterator();

        $this->assertNotNull($countries->current());
        $this->assertEquals('France', $countries->current()->name()->value());
    }

    public function testOrderByName(): void
    {
        $doctrineCountryRepository = $this->doctrineCountryRepository->sortName();

        $countries = $doctrineCountryRepository->getIterator();

        $this->assertNotNull($countries->current());
        $this->assertEquals('Afghanistan', $countries->current()->name()->value());
    }
}
