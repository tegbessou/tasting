<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Adapter;

use App\BottleInventory\Application\ReadModel\BottleList;

interface BottleListAdapterInterface
{
    public function ofId(string $id): ?BottleList;

    public function add(BottleList $bottle): void;

    public function update(BottleList $bottle): void;
}
