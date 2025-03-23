<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Invitation;
use EmpireDesAmis\Tasting\Domain\Exception\InvitationMustBePendingException;
use EmpireDesAmis\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingAcceptedException;

final readonly class InvitationCanBeAccept
{
    public function satisfiedBy(
        Invitation $invitation,
    ): void {
        if (!$invitation->status()->isPending()) {
            throw new InvitationMustBePendingException();
        }

        if (!$invitation->isAlreadySent()) {
            throw new InvitationMustBeSentBeforeBeingAcceptedException();
        }
    }
}
