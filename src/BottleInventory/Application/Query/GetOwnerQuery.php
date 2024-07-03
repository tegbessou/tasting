<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Entity\Owner;
use App\Shared\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<Owner|null>
 */
final readonly class GetOwnerQuery implements QueryInterface
{
    public function __construct(
        public string $id,
    ) {
    }
}
