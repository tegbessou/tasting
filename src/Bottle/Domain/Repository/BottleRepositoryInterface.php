<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Repository;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\ValueObject\BottleId;

interface BottleRepositoryInterface
{
    public function ofId(BottleId $bottleId): ?Bottle;

    public function add(Bottle $bottle): void;

    public function nextIdentity(): BottleId;
}
