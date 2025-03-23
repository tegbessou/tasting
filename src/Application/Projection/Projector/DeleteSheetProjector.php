<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;

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
