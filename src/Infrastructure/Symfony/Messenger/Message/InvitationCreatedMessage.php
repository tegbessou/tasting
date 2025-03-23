<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message;

use EmpireDesAmis\Tasting\Domain\Event\TastingParticipantInvited;

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
