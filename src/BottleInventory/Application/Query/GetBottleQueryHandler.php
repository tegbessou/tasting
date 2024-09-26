<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleId;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetBottleQueryHandler
{
    public function __construct(
        private BottleRepositoryInterface $bottleRepository,
    ) {
    }

    public function __invoke(
        GetBottleQuery $query,
    ): ?Bottle {
        return $this->bottleRepository->ofId(BottleId::fromString($query->id));
    }
}
