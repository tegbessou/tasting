<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Event;

use App\Shared\Domain\Event\DomainEventInterface;

final readonly class InvitationRejectedEvent implements DomainEventInterface
{
    public function __construct(
        public string $invitationId,
    ) {
    }
}
