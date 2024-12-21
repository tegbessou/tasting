<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class EyeParticipantNotInvitedException extends \Exception
{
    public function __construct(
        public readonly string $participant,
        public readonly string $tastingId,
    ) {
        parent::__construct(
            sprintf(
                'Participant with id %s is not invited to tasting with id %s',
                $this->participant,
                $this->tastingId,
            ),
        );
    }
}
