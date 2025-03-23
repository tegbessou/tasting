<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Factory\IdFactory;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAcide;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAlcool;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthFinale;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthId;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthMatiere;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthSucre;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthTanin;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class AddMouthCommandHandler
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private TastingRepositoryInterface $tastingRepository,
        private IdFactory $idFactory,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(AddMouthCommand $command): void
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

        $sheet->addMouth(
            MouthId::fromString(
                $this->idFactory->create(),
            ),
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
