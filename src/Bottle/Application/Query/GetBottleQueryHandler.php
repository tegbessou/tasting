<?php

declare(strict_types=1);

namespace App\Bottle\Application\Query;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Repository\BottleReadRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottleId;
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
