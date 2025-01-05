<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\Message;

use App\Tasting\Domain\Event\InvitationAccepted;

final readonly class CreateBottleForParticipantWhenInvitationIsAcceptedMessage
{
    public function __construct(
        public string $bottleId,
        public string $participant,
    ) {
    }

    public static function fromEvent(InvitationAccepted $event): self
    {
        return new self(
            $event->bottleId,
            $event->participant,
        );
    }
}
