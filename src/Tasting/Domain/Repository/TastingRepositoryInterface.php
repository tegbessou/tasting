<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Shared\Domain\Repository\RepositoryInterface;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;

/**
 * @extends RepositoryInterface<Tasting>
 */
interface TastingRepositoryInterface extends RepositoryInterface
{
    public function ofId(TastingId $id): ?Tasting;

    public function withBottle(BottleName $name): self;

    public function add(Tasting $tasting): void;

    public function nextIdentity(): TastingId;

    public function update(): void;
}
