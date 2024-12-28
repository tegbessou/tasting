<?php

declare(strict_types=1);

namespace App\Tasting\Application\Exception;

final class SheetParticipantDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $participant,
    ) {
        parent::__construct(sprintf('Participant %s does not exist', $this->participant));
    }
}
