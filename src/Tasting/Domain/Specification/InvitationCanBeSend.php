<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Exception\InvitationAlreadySentException;

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
