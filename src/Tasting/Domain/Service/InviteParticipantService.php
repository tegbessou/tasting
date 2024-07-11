<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantAlreadyInvitedException;

final readonly class InviteParticipantService
{
    public function canInviteParticipant(
        Participant $participant,
        Tasting $tasting,
    ): void {
        if ($tasting->owner()->id()->id() === $participant->id()->id()) {
            throw new OwnerCannotBeInvitedToTastingException();
        }

        if ($tasting->participants()->contains($participant)) {
            throw new ParticipantAlreadyInvitedException($participant->fullName()->value());
        }
    }
}
