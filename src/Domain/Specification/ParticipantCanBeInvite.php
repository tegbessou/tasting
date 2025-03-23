<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Invitation;
use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use EmpireDesAmis\Tasting\Domain\Exception\ParticipantAlreadyInvitedException;
use EmpireDesAmis\Tasting\Domain\Exception\ParticipantsAlreadyParticipatingException;
use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;

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
