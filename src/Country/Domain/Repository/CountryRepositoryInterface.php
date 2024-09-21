<?php

declare(strict_types=1);

namespace App\Country\Domain\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Country>
 */
interface CountryRepositoryInterface extends RepositoryInterface
{
    public function ofName(CountryName $name): ?Country;

    public function exist(CountryName $name): bool;

    public function withName(CountryName $name): self;

    public function sortName(): self;

    public function nextIdentity(): CountryId;

    public function add(Country $country): void;
}
