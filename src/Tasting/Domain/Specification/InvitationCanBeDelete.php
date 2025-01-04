<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Exception\InvitationMustNotBePendingException;

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
