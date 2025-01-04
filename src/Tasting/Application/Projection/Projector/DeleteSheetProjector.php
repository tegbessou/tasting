<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Exception\SheetDoesntExistException;

final readonly class DeleteSheetProjector
{
    public function __construct(
        private SheetAdapterInterface $sheetAdapter,
    ) {
    }

    public function project(string $sheetId): void
    {
        $sheet = $this->sheetAdapter->ofId($sheetId);

        if ($sheet === null) {
            throw new SheetDoesntExistException($sheetId);
        }

        $this->sheetAdapter->delete($sheet);
    }
}
