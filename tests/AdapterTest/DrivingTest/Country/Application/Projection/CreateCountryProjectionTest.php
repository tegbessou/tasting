<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Country\Application\Projection;

use App\Country\Application\Adapter\CountryAdapterInterface;
use App\Country\Application\Projection\CreateCountryProjection;
use App\Country\Domain\Entity\Country;
use App\Country\Domain\Event\CountryCreated;
use App\Country\Domain\Repository\CountryRepositoryInterface;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateCountryProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly CreateCountryProjection $countryProjection;
    private readonly CountryAdapterInterface $countryAdapter;
    private readonly CountryRepositoryInterface $countryRepository;

    public function testCreateCountryProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->countryProjection = $container->get(CreateCountryProjection::class);
        $this->countryAdapter = $container->get(CountryAdapterInterface::class);
        $this->countryRepository = $container->get(CountryRepositoryInterface::class);

        $countryEntity = Country::create(
            CountryId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            CountryName::fromString('Taboulistan'),
        );
        $countryEntity::eraseRecordedEvents();

        $this->countryRepository->add($countryEntity);

        $event = new CountryCreated(
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'Taboulistan',
        );

        $projection($event);

        $bottle = $this->countryAdapter->ofName('Taboulistan');
        $this->assertNotNull($bottle);
    }
}
