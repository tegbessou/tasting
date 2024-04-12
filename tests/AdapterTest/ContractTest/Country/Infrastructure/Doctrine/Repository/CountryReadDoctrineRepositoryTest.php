<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Country\Infrastructure\Doctrine\Repository;

use App\Country\Domain\ValueObject\CountryName;
use App\Country\Infrastructure\Doctrine\Repository\CountryReadDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryReadDoctrineRepositoryTest extends KernelTestCase
{
    private CountryReadDoctrineRepository $doctrineCountryRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineCountryRepository = $container->get(CountryReadDoctrineRepository::class);
    }

    public function testOfName(): void
    {
        $country = $this->doctrineCountryRepository->ofName(CountryName::fromString('France'));

        $this->assertNotNull($country);
        $this->assertEquals('France', $country->name()->value());
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
