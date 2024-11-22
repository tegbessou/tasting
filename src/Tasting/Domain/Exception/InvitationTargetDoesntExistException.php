<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class InvitationTargetDoesntExistException extends \Exception
{
    public function __construct(string $targetId)
    {
        parent::__construct(sprintf('Invitation target with id %s doesn\'t exist', $targetId));
    }
}
