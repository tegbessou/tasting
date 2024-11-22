<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\Message;

use App\Tasting\Domain\Event\InvitationAccepted;

final readonly class InvitationAcceptedMessage implements InvitationStatusChangedInterface
{
    public function __construct(
        private string $tastingId,
        private string $invitationId,
    ) {
    }

    public static function fromEvent(InvitationAccepted $event): self
    {
        return new self(
            $event->tastingId,
            $event->invitationId,
        );
    }

    #[\Override]
    public function getTastingId(): string
    {
        return $this->tastingId;
    }

    #[\Override]
    public function getInvitationId(): string
    {
        return $this->invitationId;
    }
}
