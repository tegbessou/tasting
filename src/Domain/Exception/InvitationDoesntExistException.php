<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Exception;

final class InvitationDoesntExistException extends \Exception
{
    public function __construct(
        public string $invitationId,
    ) {
        parent::__construct(sprintf('Invitation with id %s doesn\'t exist', $invitationId));
    }
}
