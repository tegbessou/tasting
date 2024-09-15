<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class ParticipantsAlreadyParticipatingException extends \Exception
{
    public function __construct(
        public array $participants,
    ) {
        parent::__construct(sprintf('Participants %s are already participating', implode(',', $participants)));
    }
}
