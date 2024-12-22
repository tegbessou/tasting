<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Factory\IdFactory;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class InviteParticipantsCommandHandler
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
        private IdFactory $idFactory,
    ) {
    }

    public function __invoke(InviteParticipantsCommand $command): void
    {
        $tasting = $this->tastingRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        foreach ($command->participants as $participant) {
            $tasting->invite(
                InvitationId::fromString(
                    $this->idFactory->create(),
                ),
                InvitationTarget::fromString($participant),
            );
        }

        $this->tastingRepository->update($tasting);

        $this->eventDispatcher->dispatch($tasting);
    }
}
