<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class ParticipantDoesntExistInSecurityException extends \Exception
{
    public function __construct(
        public readonly string $email,
    ) {
        parent::__construct(sprintf('Participant %s does not exist', $this->email));
    }
}
