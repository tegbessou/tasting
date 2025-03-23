<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use EmpireDesAmis\Tasting\Domain\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Factory\IdFactory;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationId;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationTarget;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
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
