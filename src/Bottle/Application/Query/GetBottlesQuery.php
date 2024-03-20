<?php

declare(strict_types=1);

namespace App\Bottle\Application\Query;

use App\Bottle\Domain\Repository\BottleRepositoryInterface;
use App\Shared\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<BottleRepositoryInterface>
 */
final class GetBottlesQuery implements QueryInterface
{
    public function __construct(
        public ?string $name,
        public ?string $estateName,
        public ?string $type,
        public ?string $savedAt,
        public ?int $year,
        public ?string $rate,
        public ?int $page,
        public ?int $limit,
    ) {
    }
}
