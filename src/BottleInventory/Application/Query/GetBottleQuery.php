<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Query;

use App\BottleInventory\Domain\Entity\Bottle;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<Bottle|null>
 */
final readonly class GetBottleQuery implements QueryInterface
{
    public function __construct(
        public string $id,
    ) {
    }
}
