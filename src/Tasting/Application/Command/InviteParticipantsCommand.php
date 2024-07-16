<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class InviteParticipantsCommand implements CommandInterface
{
    public function __construct(
        public string $tastingId,
        public array $participants,
    ) {
    }
}
