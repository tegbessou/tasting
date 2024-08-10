<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;

#[AsCommandHandler]
final readonly class AcceptInvitationCommandHandler
{
    public function __construct(
        private InvitationWriteRepositoryInterface $invitationWriteRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(AcceptInvitationCommand $command): void
    {
        $invitation = $this->invitationWriteRepository->ofId(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $invitation->accept();

        $this->dispatcher->dispatch($invitation);

        $this->invitationWriteRepository->update();
    }
}
