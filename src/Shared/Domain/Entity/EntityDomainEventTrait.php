<?php

declare(strict_types=1);

namespace App\Shared\Domain\Entity;

use App\Shared\Domain\Event\DomainEventInterface;

trait EntityDomainEventTrait
{
    private static array $recordedEvents = [];

    #[\Override]
    public static function getRecordedEvent(): array
    {
        return self::$recordedEvents;
    }

    #[\Override]
    public static function recordEvent(DomainEventInterface $event): void
    {
        self::$recordedEvents[] = $event;
    }

    #[\Override]
    public static function eraseRecordedEvents(): void
    {
        self::$recordedEvents = [];
    }
}
