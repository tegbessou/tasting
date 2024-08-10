<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\Message;

use App\Tasting\Domain\Event\InvitationAcceptedEvent;

final readonly class InvitationAcceptedMessage
{
    public function __construct(
        public string $invitationId,
    ) {
    }

    public static function fromEvent(InvitationAcceptedEvent $event): self
    {
        return new self(
            $event->invitationId,
        );
    }
}
