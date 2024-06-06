<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Messenger\Message;

use App\BottleInventory\Domain\Event\BottleTastedEvent;

final readonly class BottleTastedMessage
{
    public function __construct(
        private string $bottleId,
        private string $ownerId,
    ) {
    }

    public static function fromEvent(
        BottleTastedEvent $event,
    ): self {
        return new self(
            $event->bottleId,
            $event->ownerId,
        );
    }

    public function getBottleId(): string
    {
        return $this->bottleId;
    }

    public function getOwnerId(): string
    {
        return $this->ownerId;
    }
}
