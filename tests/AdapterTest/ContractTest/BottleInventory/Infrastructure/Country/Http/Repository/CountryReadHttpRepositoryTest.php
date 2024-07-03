<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\BottleInventory\Infrastructure\Country\Http\Repository;

use App\BottleInventory\Domain\ValueObject\CountryName;
use App\BottleInventory\Infrastructure\Country\Http\Repository\CountryReadHttpRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryReadHttpRepositoryTest extends KernelTestCase
{
    private CountryReadHttpRepository $httpCountryRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpCountryRepository = $container->get(CountryReadHttpRepository::class);
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
