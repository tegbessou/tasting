<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Adapter;

use EmpireDesAmis\Tasting\Application\ReadModel\Tasting;
use TegCorp\SharedKernelBundle\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Tasting>
 */
interface TastingAdapterInterface extends RepositoryInterface
{
    public function ofId(string $id): ?Tasting;

    public function add(Tasting $tasting): void;

    public function withBottleName(string $bottleName): TastingAdapterInterface;

    public function delete(Tasting $tasting): void;
}
