<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class ParticipantAlreadyInvitedException extends \Exception
{
    public function __construct(
        public readonly string $fullName,
    ) {
        parent::__construct(sprintf('Participant %s already invited', $this->fullName));
    }
}
