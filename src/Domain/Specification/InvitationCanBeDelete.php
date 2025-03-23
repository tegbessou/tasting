<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Invitation;
use EmpireDesAmis\Tasting\Domain\Exception\InvitationMustNotBePendingException;

final readonly class InvitationCanBeDelete
{
    public function satisfiedBy(
        Invitation $invitation,
    ): void {
        if ($invitation->status()->isPending()) {
            throw new InvitationMustNotBePendingException();
        }
    }
}
