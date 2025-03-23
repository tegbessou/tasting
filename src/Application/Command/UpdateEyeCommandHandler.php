<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeBrillance;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLarme;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLimpidite;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeTeinte;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class UpdateEyeCommandHandler
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(UpdateEyeCommand $command): void
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

        $sheet->updateEye(
            EyeLimpidite::fromString(
                $command->limpidite,
            ),
            EyeBrillance::fromString(
                $command->brillance,
            ),
            EyeIntensiteCouleur::fromString(
                $command->intensiteCouleur,
            ),
            EyeTeinte::fromString(
                $command->teinte,
            ),
            EyeLarme::fromString(
                $command->larme,
            ),
            EyeObservation::fromString(
                $command->observation,
            ),
            $tasting->bottle()->wineType(),
        );

        $this->sheetRepository->update($sheet);

        $this->dispatcher->dispatch($sheet);
    }
}
