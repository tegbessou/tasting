<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<SheetAdapterInterface>
 */
final readonly class GetSheetsQuery implements QueryInterface
{
    public function __construct(
        public ?string $tastingId = null,
        public ?string $participant = null,
    ) {
    }
}
