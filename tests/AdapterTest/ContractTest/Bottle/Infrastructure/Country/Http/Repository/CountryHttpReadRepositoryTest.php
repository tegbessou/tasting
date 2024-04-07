<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Bottle\Infrastructure\Country\Http\Repository;

use App\Bottle\Domain\ValueObject\CountryName;
use App\Bottle\Infrastructure\Country\Http\Repository\CountryHttpReadRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryHttpReadRepositoryTest extends KernelTestCase
{
    private CountryHttpReadRepository $httpCountryRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpCountryRepository = $container->get(CountryHttpReadRepository::class);
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
