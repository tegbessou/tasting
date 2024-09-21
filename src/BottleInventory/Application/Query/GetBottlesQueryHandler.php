<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleSavedAt;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use App\Shared\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetBottlesQueryHandler
{
    public function __construct(
        private BottleRepositoryInterface $bottleRepository,
    ) {
    }

    public function __invoke(GetBottlesQuery $query): BottleRepositoryInterface
    {
        $bottleRepository = $this->bottleRepository;

        $bottleRepository = $bottleRepository->sortName();

        if ($query->name !== null) {
            $bottleRepository = $bottleRepository->withName(BottleName::fromString($query->name));
        }

        if ($query->estateName !== null) {
            $bottleRepository = $bottleRepository->withEstateName(BottleEstateName::fromString($query->estateName));
        }

        if ($query->year !== null) {
            $bottleRepository = $bottleRepository->withYear(BottleYear::fromInt($query->year));
        }

        if ($query->rate !== null) {
            $bottleRepository = $bottleRepository->withRate(BottleRate::fromString($query->rate));
        }

        if ($query->savedAt !== null) {
            $bottleRepository = $bottleRepository->savedAt(BottleSavedAt::create(
                new \DateTimeImmutable(
                    $query->savedAt
                ),
            ));
        }

        if ($query->type !== null) {
            $bottleRepository = $bottleRepository->withWineType(BottleWineType::fromString($query->type));
        }

        if ($query->page !== null && $query->limit !== null) {
            $bottleRepository = $bottleRepository->withPagination($query->page, $query->limit);
        }

        return $bottleRepository;
    }
}
