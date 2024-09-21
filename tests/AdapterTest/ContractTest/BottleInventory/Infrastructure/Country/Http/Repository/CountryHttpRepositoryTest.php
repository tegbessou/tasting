<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\BottleInventory\Infrastructure\Country\Http\Repository;

use App\BottleInventory\Domain\Repository\CountryRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\CountryName;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryHttpRepositoryTest extends KernelTestCase
{
    private CountryRepositoryInterface $httpCountryRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpCountryRepository = $container->get(CountryRepositoryInterface::class);
    }

    public function testExist(): void
    {
        $this->assertTrue(
            $this->httpCountryRepository->exist(CountryName::fromString('France')),
        );
    }

    public function testNotExist(): void
    {
        $this->assertFalse(
            $this->httpCountryRepository->exist(CountryName::fromString('Spain')),
        );
    }
}
