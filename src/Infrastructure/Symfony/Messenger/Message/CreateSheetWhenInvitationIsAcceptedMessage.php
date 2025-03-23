<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message;

use EmpireDesAmis\Tasting\Domain\Event\InvitationAccepted;

final readonly class CreateSheetWhenInvitationIsAcceptedMessage
{
    public function __construct(
        public string $tastingId,
        public string $participant,
    ) {
    }

    public static function fromEvent(InvitationAccepted $event): self
    {
        return new self(
            $event->tastingId,
            $event->participant,
        );
    }
}
