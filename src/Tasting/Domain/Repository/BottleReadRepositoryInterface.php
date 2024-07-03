<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\BottleId;

interface BottleReadRepositoryInterface
{
    public function ofId(BottleId $bottleId): ?Bottle;
}
