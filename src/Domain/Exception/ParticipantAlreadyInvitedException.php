<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Exception;

final class ParticipantAlreadyInvitedException extends \Exception
{
    public function __construct(
        public string $participant,
    ) {
        parent::__construct(sprintf('Participant %s is already invited', $participant));
    }
}
