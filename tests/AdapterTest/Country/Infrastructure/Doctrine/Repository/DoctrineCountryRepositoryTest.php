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
    public function testFindByName(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineCountryRepository = $container->get(DoctrineCountryRepository::class);

        $country = $doctrineCountryRepository->findByName('France');

        $this->assertNotNull($country);
        $this->assertEquals('France', $country->name()->value());
    }

    public function testAlreadyExist(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineCountryRepository = $container->get(DoctrineCountryRepository::class);

        $this->assertTrue($doctrineCountryRepository->isAlreadyExist(CountryName::fromString('France')));
    }

    public function testNextIdentity(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineCountryRepository::class);

        $nextIdentity = $doctrineUserRepository->nextIdentity();

        $this->assertIsString($nextIdentity->value());
    }

    public function testAdd(): void
    {
        self::bootKernel();

        $doctrineCountryRepository = static::getContainer()->get(DoctrineCountryRepository::class);

        $country = new Country(
            CountryId::fromString('10ce4cd1-33a1-4cb1-a90b-6d30ff23b0d6'),
            CountryName::fromString('France2'),
        );
        $doctrineCountryRepository->add($country);

        $country = $doctrineCountryRepository->findByName('France2');

        $this->assertNotNull($country);
    }

    public function testFilterByName(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineCountryRepository = $container->get(DoctrineCountryRepository::class);

        $doctrineCountryRepository = $doctrineCountryRepository->filterByName('France');

        $countries = $doctrineCountryRepository->getIterator();

        $this->assertNotNull($countries->current());
        $this->assertEquals('France', $countries->current()->name()->value());
    }

    public function testOrderByName(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineCountryRepository = $container->get(DoctrineCountryRepository::class);

        $doctrineCountryRepository = $doctrineCountryRepository->orderByName();

        $countries = $doctrineCountryRepository->getIterator();

        $this->assertNotNull($countries->current());
        $this->assertEquals('Afghanistan', $countries->current()->name()->value());
    }
}
