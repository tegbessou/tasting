<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\Country\Infrastructure\Doctrine\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use App\Country\Infrastructure\Doctrine\Repository\DoctrineCountryRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DoctrineCountryRepositoryTest extends KernelTestCase
{
    private DoctrineCountryRepository $doctrineCountryRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $this->doctrineCountryRepository = $container->get(DoctrineCountryRepository::class);
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

    public function testNextIdentity(): void
    {
        $nextIdentity = $this->doctrineCountryRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testAdd(): void
    {
        $country = new Country(
            CountryId::fromString('10ce4cd1-33a1-4cb1-a90b-6d30ff23b0d6'),
            CountryName::fromString('France2'),
        );
        $this->doctrineCountryRepository->add($country);

        $country = $this->doctrineCountryRepository->ofName(CountryName::fromString('France2'));

        $this->assertNotNull($country);
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
