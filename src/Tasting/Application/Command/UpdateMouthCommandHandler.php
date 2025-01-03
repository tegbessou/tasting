<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\MouthAcide;
use App\Tasting\Domain\ValueObject\MouthAlcool;
use App\Tasting\Domain\ValueObject\MouthFinale;
use App\Tasting\Domain\ValueObject\MouthMatiere;
use App\Tasting\Domain\ValueObject\MouthObservation;
use App\Tasting\Domain\ValueObject\MouthSucre;
use App\Tasting\Domain\ValueObject\MouthTanin;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class UpdateMouthCommandHandler
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(UpdateMouthCommand $command): void
    {
        $sheet = $this->sheetRepository->ofId(
            SheetId::fromString($command->sheetId),
        );

        if ($sheet === null) {
            throw new SheetDoesntExistException($command->sheetId);
        }

        $tasting = $this->tastingRepository->ofId(
            TastingId::fromString($sheet->tastingId()->value()),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($sheet->tastingId()->value());
        }

        $sheet->updateMouth(
            MouthAlcool::fromString(
                $command->alcool,
            ),
            MouthAcide::fromString(
                $command->acide,
            ),
            MouthMatiere::fromString(
                $command->matiere,
            ),
            MouthFinale::fromString(
                $command->finale,
            ),
            MouthObservation::fromString(
                $command->observation,
            ),
            $tasting->bottle()->wineType(),
            $command->tanin !== null
                ? MouthTanin::fromString(
                    $command->tanin,
                )
                : null,
            $command->sucre !== null
                ? MouthSucre::fromString(
                    $command->sucre,
                )
                : null,
        );

        $this->sheetRepository->update($sheet);

        $this->dispatcher->dispatch($sheet);
    }
}
