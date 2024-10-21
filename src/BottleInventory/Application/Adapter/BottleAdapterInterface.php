<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Adapter;

use App\BottleInventory\Application\ReadModel\Bottle;

interface BottleAdapterInterface
{
    public function ofId(string $id): ?Bottle;

    public function add(Bottle $bottle): void;

    public function update(Bottle $bottle): void;
}
