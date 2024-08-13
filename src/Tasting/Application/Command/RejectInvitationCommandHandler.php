<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\Repository\TastingWriteRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\TastingId;

#[AsCommandHandler]
final readonly class RejectInvitationCommandHandler
{
    public function __construct(
        private InvitationWriteRepositoryInterface $invitationWriteRepository,
        private TastingWriteRepositoryInterface $tastingWriteRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(RejectInvitationCommand $command): void
    {
        $tasting = $this->tastingWriteRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        $invitation = $this->invitationWriteRepository->ofId(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $tasting->rejectInvitation($invitation);

        $this->dispatcher->dispatch($invitation);

        $this->invitationWriteRepository->update();
    }
}
