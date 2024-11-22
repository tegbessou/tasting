<?php

declare(strict_types=1);

namespace App\Tasting\Application\Exception;

final class InvitationDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $invitationId,
    ) {
        parent::__construct(sprintf('Invitation %s does not exist', $this->invitationId));
    }
}
