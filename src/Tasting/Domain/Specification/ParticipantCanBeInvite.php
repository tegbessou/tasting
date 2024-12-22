<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantAlreadyInvitedException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyParticipatingException;
use App\Tasting\Domain\ValueObject\ParticipantId;

final readonly class ParticipantCanBeInvite
{
    public function __construct(
        private Tasting $tasting,
    ) {
    }

    public function satisfiedBy(
        Invitation $invitation,
    ): void {
        if ($this->tasting->ownerId()->value() === $invitation->target()->value()) {
            throw new OwnerCannotBeInvitedToTastingException();
        }

        if ($this->tasting->participantAlreadyInvited($invitation->target()->value())) {
            throw new ParticipantAlreadyInvitedException($invitation->target()->value());
        }

        if ($this->tasting->participants()->contains(ParticipantId::fromString($invitation->target()->value()))) {
            throw new ParticipantsAlreadyParticipatingException($invitation->target()->value());
        }
    }
}
