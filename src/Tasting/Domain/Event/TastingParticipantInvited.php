<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final readonly class TastingParticipantInvited implements DomainEventInterface
{
    public function __construct(
        public string $invitationId,
        public string $targetEmail,
        public string $link,
        public string $ownerEmail,
        public string $bottleName,
    ) {
    }
}
