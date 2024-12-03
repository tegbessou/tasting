<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Country\Infrastructure\Doctrine\Adapter;

use App\Country\Application\Adapter\CountryAdapterInterface;
use App\Country\Application\ReadModel\Country;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryDoctrineAdapterTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly CountryAdapterInterface $countryAdapter;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->countryAdapter = $container->get(CountryAdapterInterface::class);
    }

    public function testOfName(): void
    {
        $this->assertNotNull(
            $this->countryAdapter->ofName('France'),
        );
    }

    public function testOfNameNull(): void
    {
        $this->assertNull(
            $this->countryAdapter->ofName('Taboulistan'),
        );
    }

    public function testAdd(): void
    {
        $country = new Country(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            'Taboulistan',
        );

        $this->countryAdapter->add($country);

        $country = $this->countryAdapter->ofName('Taboulistan');
        $this->assertNotNull($country);
    }

    public function testWithName(): void
    {
        $doctrineCountryRepository = $this->countryAdapter->withName('France');

        $countries = $doctrineCountryRepository->getIterator();

        $this->assertNotNull($countries->current());
        $this->assertEquals('France', $countries->current()->name);
    }

    public function testOrderByName(): void
    {
        $doctrineAdapterRepository = $this->countryAdapter->sortName();

        $countries = $doctrineAdapterRepository->getIterator();

        $this->assertNotNull($countries->current());
        $this->assertEquals('Afghanistan', $countries->current()->name);
    }
}
