<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetSheetsQueryHandler
{
    public function __construct(
        private SheetAdapterInterface $sheetAdapter,
    ) {
    }

    public function __invoke(GetSheetsQuery $query): SheetAdapterInterface
    {
        $sheetAdapter = $this->sheetAdapter;

        if ($query->tastingId !== null) {
            $sheetAdapter = $sheetAdapter->withTasting(
                $query->tastingId,
            );
        }

        if ($query->participant !== null) {
            $sheetAdapter = $sheetAdapter->withParticipant(
                $query->participant,
            );
        }

        return $sheetAdapter;
    }
}
