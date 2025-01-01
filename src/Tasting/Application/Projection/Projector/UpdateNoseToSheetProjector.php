<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Exception\SheetDoesntExistException;

final readonly class UpdateNoseToSheetProjector
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
