<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Exception\SheetDoesntExistException;

final readonly class UpdateEyeToSheetProjector
{
    public function __construct(
        private SheetAdapterInterface $sheetAdapter,
    ) {
    }

    public function project(
        string $sheetId,
        string $limpidite,
        string $brillance,
        string $intensiteCouleur,
        string $teinte,
        string $larme,
        string $observation,
    ): void {
        $sheet = $this->sheetAdapter->ofId($sheetId);

        if ($sheet === null) {
            throw new SheetDoesntExistException($sheetId);
        }

        $sheet->eyeLimpidite = $limpidite;
        $sheet->eyeBrillance = $brillance;
        $sheet->eyeIntensiteCouleur = $intensiteCouleur;
        $sheet->eyeTeinte = $teinte;
        $sheet->eyeLarme = $larme;
        $sheet->eyeObservation = $observation;

        $this->sheetAdapter->update($sheet);
    }
}
