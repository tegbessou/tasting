<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;

final readonly class AddNoseToSheetProjector
{
    public function __construct(
        private SheetAdapterInterface $sheetAdapter,
    ) {
    }

    public function project(
        string $sheetId,
        string $impression,
        string $intensite,
        string $arome,
        string $observation,
    ): void {
        $sheet = $this->sheetAdapter->ofId($sheetId);

        if ($sheet === null) {
            throw new SheetDoesntExistException($sheetId);
        }

        $sheet->noseImpression = $impression;
        $sheet->noseIntensite = $intensite;
        $sheet->noseArome = $arome;
        $sheet->noseObservation = $observation;

        $this->sheetAdapter->update($sheet);
    }
}
