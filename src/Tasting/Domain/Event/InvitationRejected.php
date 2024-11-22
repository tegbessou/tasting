<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final readonly class InvitationRejected implements DomainEventInterface
{
    public function __construct(
        public string $tastingId,
        public string $invitationId,
    ) {
    }
}
