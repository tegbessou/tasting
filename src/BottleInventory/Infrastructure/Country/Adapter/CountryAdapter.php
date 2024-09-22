<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Country\Adapter;

use App\BottleInventory\Domain\Adapter\CountryAdapterInterface;
use App\BottleInventory\Domain\ValueObject\CountryName;
use App\BottleInventory\Infrastructure\Country\Repository\CountryRepositoryInterface;

final readonly class CountryAdapter implements CountryAdapterInterface
{
    public function __construct(
        private CountryRepositoryInterface $countryRepository,
    ) {
    }

    #[\Override]
    public function exist(CountryName $name): bool
    {
        return count($this->countryRepository->ofName($name->value())) === 1;
    }
}
