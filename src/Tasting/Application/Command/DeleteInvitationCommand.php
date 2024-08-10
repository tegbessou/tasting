<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class DeleteInvitationCommand implements CommandInterface
{
    public function __construct(
        public string $invitationId,
    ) {
    }
}
