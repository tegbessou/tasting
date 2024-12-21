<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Factory\IdFactory;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeParticipant;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class AddEyeCommandHandler
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private IdFactory $idFactory,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(AddEyeCommand $command): void
    {
        $tasting = $this->tastingRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        $tasting->addEye(
            EyeId::fromString(
                $this->idFactory->create(),
            ),
            EyeParticipant::fromString(
                $command->participant,
            ),
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
        );

        $this->tastingRepository->update($tasting);

        $this->dispatcher->dispatch($tasting);
    }
}
