<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Country\Repository;

interface CountryRepositoryInterface
{
    public const COUNTRY_URI = '/api/countries';
    public const HEADER_IDENTITY_PROVIDER = 'RequestHeaderIdentityProvider';

    public function ofName(string $name): array;
}
