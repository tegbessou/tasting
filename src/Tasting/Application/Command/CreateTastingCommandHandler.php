<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

#[AsCommandHandler]
final readonly class CreateTastingCommandHandler
{
    public function __construct(
        private ParticipantRepositoryInterface $participantRepository,
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $domainEventDispatcher,
    ) {
    }

    public function __invoke(CreateTastingCommand $command): void
    {
        $participant = $this->participantRepository->ofEmail(ParticipantEmail::fromString($command->ownerEmail));

        if ($participant === null) {
            throw new OwnerDoesntExistException($command->ownerEmail);
        }

        $tasting = Tasting::create(
            $this->tastingRepository->nextIdentity(),
            BottleName::fromString($command->bottleName),
            $participant,
        );

        $this->domainEventDispatcher->dispatch($tasting);

        $this->tastingRepository->add(
            $tasting,
        );
    }
}
