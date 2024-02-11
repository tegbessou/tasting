<?php

declare(strict_types=1);

namespace App\User\Domain\Event;

use Symfony\Contracts\EventDispatcher\Event;

final class BottleUpdateNotAuthorizeEvent extends Event
{
    public function __construct(
        public string $ownerId,
    ) {
    }
}
