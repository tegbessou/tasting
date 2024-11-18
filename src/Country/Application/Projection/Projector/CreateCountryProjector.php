<?php

declare(strict_types=1);

namespace App\Country\Application\Projection\Projector;

use App\Country\Application\Adapter\CountryAdapterInterface;
use App\Country\Application\Exception\CountryDoesntExistException;
use App\Country\Application\ReadModel\Country;
use App\Country\Domain\Repository\CountryRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;

final readonly class CreateCountryProjector
{
    public function __construct(
        private CountryRepositoryInterface $countryRepository,
        private CountryAdapterInterface $countryAdapter,
    ) {
    }

    public function project(string $id, string $name): void
    {
        $country = $this->countryRepository->ofName(
            CountryName::fromString($name),
        );

        if ($country === null) {
            throw new CountryDoesntExistException($name);
        }

        $country = new Country(
            $id,
            $name,
        );

        $this->countryAdapter->add($country);
    }
}
