<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class InvitationSent extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $invitationId,
        public \DateTimeImmutable $sentAt,
    ) {
        parent::__construct();
    }
}
