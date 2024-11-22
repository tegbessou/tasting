<?php

declare(strict_types=1);

namespace App\Tasting\Application\Adapter;

use App\Tasting\Application\ReadModel\Tasting;

interface TastingAdapterInterface
{
    public function ofId(string $id): ?Tasting;

    public function add(Tasting $tasting): void;
}
