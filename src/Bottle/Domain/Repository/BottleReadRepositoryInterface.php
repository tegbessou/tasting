<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Repository;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleSavedAt;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Shared\Domain\Repository\ReadRepositoryInterface;

/**
 * @extends ReadRepositoryInterface<Bottle>
 */
interface BottleReadRepositoryInterface extends ReadRepositoryInterface
{
    public function ofId(BottleId $bottleId): ?Bottle;

    public function sortName(): self;

    public function withName(BottleName $name): self;

    public function withEstateName(BottleEstateName $estateName): self;

    public function withYear(BottleYear $year): self;

    public function withRate(BottleRate $rate): self;

    public function savedAt(BottleSavedAt $savedAt): self;

    public function withWineType(BottleWineType $wineType): self;
}
