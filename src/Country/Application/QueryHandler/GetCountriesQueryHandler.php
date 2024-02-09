<?php

declare(strict_types=1);

namespace App\Country\Application\QueryHandler;

use App\Country\Application\Query\GetCountriesQuery;
use App\Country\Domain\Repository\CountryRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetCountriesQueryHandler
{
    public function __construct(
        private CountryRepositoryInterface $countryRepository,
    ) {
    }

    public function __invoke(GetCountriesQuery $query): CountryRepositoryInterface
    {
        $countryRepository = $this->countryRepository;

        $countryRepository = $countryRepository->sortName();

        if ($query->name !== null) {
            $countryRepository = $countryRepository->withName(CountryName::fromString($query->name));
        }

        if ($query->page !== null && $query->limit !== null) {
            $countryRepository = $countryRepository->withPagination($query->page, $query->limit);
        }

        return $countryRepository;
    }
}
