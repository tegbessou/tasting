<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Country\Http\Repository;

use App\BottleInventory\Domain\Repository\CountryReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\CountryName;
use App\BottleInventory\Infrastructure\Country\Http\Client\CountryHttpClientInterface;

final readonly class CountryReadHttpRepository implements CountryReadRepositoryInterface
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
