<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class DeleteInvitationCommand implements CommandInterface
{
    public function __construct(
        public string $tastingId,
        public string $invitationId,
    ) {
    }
}
