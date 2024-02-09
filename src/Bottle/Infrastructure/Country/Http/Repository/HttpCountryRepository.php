<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Country\Http\Repository;

use App\Bottle\Domain\Repository\CountryRepositoryInterface;
use App\Bottle\Domain\ValueObject\CountryName;
use App\Bottle\Infrastructure\Country\Http\Client\CountryHttpClientInterface;

final readonly class HttpCountryRepository implements CountryRepositoryInterface
{
    public function __construct(
        private CountryHttpClientInterface $countryHttpClient,
    ) {
    }

    #[\Override]
    public function exist(CountryName $name): bool
    {
        return count($this->countryHttpClient->ofName($name->value())) === 1;
    }
}
