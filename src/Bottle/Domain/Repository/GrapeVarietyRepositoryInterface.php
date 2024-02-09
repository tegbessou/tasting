<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Repository;

use App\Bottle\Domain\ValueObject\GrapeVarietyName;

interface GrapeVarietyRepositoryInterface
{
    public function exist(GrapeVarietyName $name): bool;
}
