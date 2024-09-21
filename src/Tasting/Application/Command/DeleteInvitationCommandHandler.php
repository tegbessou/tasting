<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;

#[AsCommandHandler]
final readonly class DeleteInvitationCommandHandler
{
    public function __construct(
        private InvitationRepositoryInterface $invitationRepository,
    ) {
    }

    public function __invoke(DeleteInvitationCommand $command): void
    {
        $invitation = $this->invitationRepository->ofId(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $this->invitationRepository->delete($invitation);
    }
}
