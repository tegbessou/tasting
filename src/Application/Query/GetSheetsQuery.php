<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Query;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
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
