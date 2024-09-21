<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Messenger\Message;

use App\BottleInventory\Domain\Event\BottleTasted;

final readonly class BottleTastedMessage
{
    public function __construct(
        public string $bottleId,
        public string $ownerEmail,
    ) {
    }

    public static function fromEvent(
        BottleTasted $event,
    ): self {
        return new self(
            $event->bottleId,
            $event->ownerId,
        );
    }
}
