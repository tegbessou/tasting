<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class ParticipantAlreadyExistException extends \Exception
{
    public function __construct(string $email)
    {
        parent::__construct(sprintf('Participant with email %s already exist', $email));
    }
}
