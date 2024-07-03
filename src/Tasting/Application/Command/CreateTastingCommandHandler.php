<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\BottleDoesntExistException;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Domain\Repository\BottleReadRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\Repository\TastingWriteRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

#[AsCommandHandler]
final readonly class CreateTastingCommandHandler
{
    public function __construct(
        private BottleReadRepositoryInterface $bottleReadRepository,
        private ParticipantReadRepositoryInterface $participantReadRepository,
        private TastingWriteRepositoryInterface $tastingWriteRepository,
        private DomainEventDispatcherInterface $domainEventDispatcher,
    ) {
    }

    public function __invoke(CreateTastingCommand $command): void
    {
        if (!$this->bottleReadRepository->ofId(BottleId::fromString($command->bottleId))) {
            throw new BottleDoesntExistException($command->bottleId);
        }

        $participant = $this->participantReadRepository->ofEmail(ParticipantEmail::fromString($command->ownerEmail));

        if ($participant === null) {
            throw new OwnerDoesntExistException($command->ownerEmail);
        }

        $tasting = Tasting::create(
            $this->tastingWriteRepository->nextIdentity(),
            BottleId::fromString($command->bottleId),
            $participant,
        );

        $this->domainEventDispatcher->dispatch($tasting);

        $this->tastingWriteRepository->add(
            $tasting,
        );
    }
}
