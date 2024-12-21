<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class EyeParticipantAlreadyAddEyeException extends \Exception
{
    public function __construct(
        public readonly string $participant,
        public readonly string $tastingId,
    ) {
        parent::__construct(
            sprintf(
                'Participant with id %s have already add his eye to the tasting with id %s',
                $participant,
                $tastingId,
            ),
        );
    }
}
