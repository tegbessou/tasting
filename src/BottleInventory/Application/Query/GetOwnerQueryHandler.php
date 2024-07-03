<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\OwnerReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetOwnerQueryHandler
{
    public function __construct(
        private OwnerReadRepositoryInterface $ownerReadRepository,
    ) {
    }

    public function __invoke(
        GetOwnerQuery $query,
    ): ?Owner {
        return $this->ownerReadRepository->ofId(OwnerId::fromString($query->id));
    }
}
