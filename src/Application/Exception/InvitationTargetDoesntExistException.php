<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Exception;

final class InvitationTargetDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $targetId,
    ) {
        parent::__construct(sprintf('Invitation target %s does not exist', $this->targetId));
    }
}
