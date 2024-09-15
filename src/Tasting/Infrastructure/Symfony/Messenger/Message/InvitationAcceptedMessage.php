<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\Message;

use App\Tasting\Domain\Event\InvitationAcceptedEvent;

final readonly class InvitationAcceptedMessage implements InvitationStatusChangedInterface
{
    public function __construct(
        private string $invitationId,
    ) {
    }

    public static function fromEvent(InvitationAcceptedEvent $event): self
    {
        return new self(
            $event->invitationId,
        );
    }

    #[\Override]
    public function getInvitationId(): string
    {
        return $this->invitationId;
    }
}
