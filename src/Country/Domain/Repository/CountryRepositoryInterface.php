<?php

declare(strict_types=1);

namespace App\Country\Domain\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use TegCorp\SharedKernelBundle\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Country>
 */
interface CountryRepositoryInterface extends RepositoryInterface
{
    public function ofName(CountryName $name): ?Country;

    public function nextIdentity(): CountryId;

    public function add(Country $country): void;
}
