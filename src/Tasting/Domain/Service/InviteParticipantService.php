<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;

final readonly class InviteParticipantService
{
    public function canInviteParticipants(
        Tasting $tasting,
        array $participants,
    ): void {
        $this->isOwnerInList($participants, $tasting);
        $this->areAlreadyInvited($participants, $tasting);
    }

    private function isOwnerInList(array $participants, Tasting $tasting): void
    {
        if ($participants === []) {
            return;
        }

        foreach ($participants as $participant) {
            if ($tasting->owner()->id()->value() !== $participant->id()->value()) {
                continue;
            }

            throw new OwnerCannotBeInvitedToTastingException();
        }
    }

    private function areAlreadyInvited(array $participants, Tasting $tasting): void
    {
        $participantsAlreadyInvited = [];

        /** @var Participant $participant */
        foreach ($participants as $participant) {
            if (!$tasting->participants()->contains($participant)) {
                continue;
            }

            $participantsAlreadyInvited[] = $participant->fullName()->value();
        }

        if ($participantsAlreadyInvited === []) {
            return;
        }

        throw new ParticipantsAlreadyInvitedException($participantsAlreadyInvited);
    }
}
