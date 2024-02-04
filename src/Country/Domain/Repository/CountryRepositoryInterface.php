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
    public function findByName(string $name): ?Country;

    public function isAlreadyExist(CountryName $name): bool;

    public function add(Country $country): void;

    public function nextIdentity(): CountryId;

    public function filterByName(string $name): self;

    public function orderByName(): self;
}
