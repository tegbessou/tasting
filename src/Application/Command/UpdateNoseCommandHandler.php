<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseArome;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseImpression;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseIntensite;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class UpdateNoseCommandHandler
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(UpdateNoseCommand $command): void
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

        $sheet->updateNose(
            NoseImpression::fromString(
                $command->impression,
            ),
            NoseIntensite::fromString(
                $command->intensite,
            ),
            NoseArome::fromString(
                $command->arome,
            ),
            NoseObservation::fromString(
                $command->observation,
            ),
        );

        $this->sheetRepository->update($sheet);

        $this->dispatcher->dispatch($sheet);
    }
}
