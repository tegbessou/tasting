<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message;

use EmpireDesAmis\Tasting\Domain\Event\InvitationRejected;

final readonly class InvitationRejectedMessage implements InvitationStatusChangedInterface
{
    public function __construct(
        private string $tastingId,
        private string $invitationId,
    ) {
    }

    public static function fromEvent(InvitationRejected $event): self
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
