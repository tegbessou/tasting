<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message;

use EmpireDesAmis\Tasting\Domain\Event\TastingDeleted;

final readonly class TastingDeletedMessage
{
    public function __construct(
        public string $tastingId,
    ) {
    }

    public static function fromEvent(TastingDeleted $event): self
    {
        return new self(
            $event->tastingId,
        );
    }
}
