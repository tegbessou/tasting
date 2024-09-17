<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Shared\Domain\Repository\ReadRepositoryInterface;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;

/**
 * @extends ReadRepositoryInterface<Tasting>
 */
interface TastingReadRepositoryInterface extends ReadRepositoryInterface
{
    public function ofId(TastingId $id): ?Tasting;

    public function withBottle(BottleName $name): self;
}
