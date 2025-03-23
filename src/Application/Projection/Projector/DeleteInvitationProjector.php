<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\InvitationAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\InvitationDoesntExistException;

final readonly class DeleteInvitationProjector
{
    public function __construct(
        private InvitationAdapterInterface $invitationAdapter,
    ) {
    }

    public function project(string $invitationId): void
    {
        $invitation = $this->invitationAdapter->ofId($invitationId);

        if ($invitation === null) {
            throw new InvitationDoesntExistException($invitationId);
        }

        $this->invitationAdapter->delete($invitation);
    }
}
