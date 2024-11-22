<?php

declare(strict_types=1);

namespace App\Tasting\Application\Event;

final readonly class TargetSetFullNameEvent
{
    public function __construct(
        public string $targetId,
        public string $targetFullName,
    ) {
    }
}
