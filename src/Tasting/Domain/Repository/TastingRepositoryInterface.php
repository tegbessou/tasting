<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;

interface TastingRepositoryInterface
{
    public function ofId(TastingId $id): ?Tasting;

    public function withBottle(BottleName $name): \Iterator;

    public function add(Tasting $tasting): void;

    public function nextIdentity(): TastingId;

    public function update(Tasting $tasting): void;
}
