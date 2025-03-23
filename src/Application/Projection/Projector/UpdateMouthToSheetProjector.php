<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;

final readonly class UpdateMouthToSheetProjector
{
    public function __construct(
        private SheetAdapterInterface $sheetAdapter,
    ) {
    }

    public function project(
        string $sheetId,
        string $alcool,
        string $acide,
        string $matiere,
        string $finale,
        string $observation,
        ?string $tanin = null,
        ?string $sucre = null,
    ): void {
        $sheet = $this->sheetAdapter->ofId($sheetId);

        if ($sheet === null) {
            throw new SheetDoesntExistException($sheetId);
        }

        $sheet->mouthAlcool = $alcool;
        $sheet->mouthAcide = $acide;
        $sheet->mouthMatiere = $matiere;
        $sheet->mouthFinale = $finale;
        $sheet->mouthObservation = $observation;
        $sheet->mouthTanin = $tanin;
        $sheet->mouthSucre = $sucre;

        $this->sheetAdapter->update($sheet);
    }
}
