<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Repository\BottleReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\Shared\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetBottleQueryHandler
{
    public function __construct(
        private BottleReadRepositoryInterface $bottleReadRepository,
    ) {
    }

    public function __invoke(
        GetBottleQuery $query,
    ): ?Bottle {
        return $this->bottleReadRepository->ofId(BottleId::fromString($query->id));
    }
}
