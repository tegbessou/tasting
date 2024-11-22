<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\Message;

use App\Tasting\Domain\Event\TastingParticipantInvited;

final readonly class InvitationCreatedMessage
{
    public function __construct(
        public string $tastingId,
        public string $invitationId,
    ) {
    }

    public static function fromEvent(TastingParticipantInvited $event): self
    {
        return new self(
            $event->tastingId,
            $event->invitationId,
        );
    }
}
