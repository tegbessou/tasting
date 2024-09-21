<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\ValueObject\CountryName;

interface CountryRepositoryInterface
{
    public function exist(CountryName $name): bool;
}
