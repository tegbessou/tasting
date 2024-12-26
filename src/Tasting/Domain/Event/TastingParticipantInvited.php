<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class TastingParticipantInvited extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $invitationId,
        public string $tastingId,
        public string $bottleName,
        public string $fromId,
        public string $targetId,
        public string $link,
        public \DateTimeImmutable $createdAt,
    ) {
        parent::__construct();
    }
}
