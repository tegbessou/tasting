<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class ParticipantsAlreadyParticipatingException extends \Exception
{
    public function __construct(
        public string $participant,
    ) {
        parent::__construct(sprintf('Participant %s is already participating', $participant));
    }
}
