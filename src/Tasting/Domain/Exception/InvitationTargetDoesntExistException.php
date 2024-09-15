<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class InvitationTargetDoesntExistException extends \Exception
{
    public function __construct(string $ownerEmail)
    {
        parent::__construct(sprintf('Invitation target with email %s doesn\'t exist', $ownerEmail));
    }
}
