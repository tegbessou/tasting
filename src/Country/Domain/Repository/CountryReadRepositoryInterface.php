<?php

declare(strict_types=1);

namespace App\Country\Domain\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Domain\Repository\ReadRepositoryInterface;

/**
 * @extends ReadRepositoryInterface<Country>
 */
interface CountryReadRepositoryInterface extends ReadRepositoryInterface
{
    public function ofName(CountryName $name): ?Country;

    public function exist(CountryName $name): bool;

    public function withName(CountryName $name): self;

    public function sortName(): self;
}
