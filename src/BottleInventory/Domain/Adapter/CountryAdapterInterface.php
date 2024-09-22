<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Adapter;

use App\BottleInventory\Domain\ValueObject\CountryName;

interface CountryAdapterInterface
{
    public function exist(CountryName $name): bool;
}
