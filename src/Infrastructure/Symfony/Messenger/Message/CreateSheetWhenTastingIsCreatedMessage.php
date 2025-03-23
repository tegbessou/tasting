<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message;

use EmpireDesAmis\Tasting\Domain\Event\TastingCreated;

final readonly class CreateSheetWhenTastingIsCreatedMessage
{
    public function __construct(
        public string $tastingId,
        public string $participant,
    ) {
    }

    public static function fromEvent(TastingCreated $event): self
    {
        return new self(
            $event->tastingId,
            $event->participants[0],
        );
    }
}
