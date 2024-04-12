<?php

declare(strict_types=1);

namespace App\Country\Domain\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;

interface CountryWriteRepositoryInterface
{
    public function ofName(CountryName $name): ?Country;

    public function add(Country $country): void;

    public function nextIdentity(): CountryId;
}
