<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Invitation;
use EmpireDesAmis\Tasting\Domain\Exception\InvitationAlreadySentException;

final readonly class InvitationCanBeSend
{
    public function satisfiedBy(
        Invitation $invitation,
    ): void {
        if ($invitation->isAlreadySent()) {
            throw new InvitationAlreadySentException();
        }
    }
}
