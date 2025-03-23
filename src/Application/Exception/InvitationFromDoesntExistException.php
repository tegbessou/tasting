<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Exception;

final class InvitationFromDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $fromId,
    ) {
        parent::__construct(sprintf('Invitation from %s does not exist', $this->fromId));
    }
}
