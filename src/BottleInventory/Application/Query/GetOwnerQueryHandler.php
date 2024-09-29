<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\OwnerRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetOwnerQueryHandler
{
    public function __construct(
        private OwnerRepositoryInterface $ownerRepository,
    ) {
    }

    public function __invoke(
        GetOwnerQuery $query,
    ): ?Owner {
        return $this->ownerRepository->ofId(OwnerId::fromString($query->id));
    }
}
