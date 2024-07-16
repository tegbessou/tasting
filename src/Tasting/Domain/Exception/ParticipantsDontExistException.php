<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class ParticipantsDontExistException extends \Exception
{
    public function __construct(
        public array $participants,
    ) {
        parent::__construct(sprintf('Participants %s don\'t exist', implode(',', $participants)));
    }
}
