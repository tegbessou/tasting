<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Repository;

use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;

interface GrapeVarietyRepositoryInterface
{
    public function exist(GrapeVarietyName $name): bool;
}
