<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Repository;

use App\Bottle\Domain\ValueObject\CountryName;

interface CountryReadRepositoryInterface
{
    public function exist(CountryName $name): bool;
}
