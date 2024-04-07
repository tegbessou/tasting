<?php

declare(strict_types=1);

namespace App\Shared\Domain\Entity;

use App\Shared\Domain\Event\DomainEventInterface;

interface EntityWithDomainEventInterface
{
    /**
     * @return DomainEventInterface[]
     */
    public static function getRecordedEvent(): array;

    public static function recordEvent(DomainEventInterface $event): void;

    public static function eraseRecordedEvents(): void;
}
