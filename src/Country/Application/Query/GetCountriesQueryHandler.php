<?php

declare(strict_types=1);

namespace App\Country\Application\Query;

use App\Country\Application\Adapter\CountryAdapterInterface;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetCountriesQueryHandler
{
    public function __construct(
        private CountryAdapterInterface $countryAdapter,
    ) {
    }

    public function __invoke(GetCountriesQuery $query): CountryAdapterInterface
    {
        $countryRepository = $this->countryAdapter;

        $countryRepository = $countryRepository->sortName();

        if ($query->name !== null) {
            $countryRepository = $countryRepository->withName($query->name);
        }

        if ($query->page !== null && $query->limit !== null) {
            $countryRepository = $countryRepository->withPagination($query->page, $query->limit);
        }

        return $countryRepository;
    }
}
