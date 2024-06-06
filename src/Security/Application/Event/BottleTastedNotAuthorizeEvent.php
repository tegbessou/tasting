<?php

declare(strict_types=1);

namespace App\Security\Application\Event;

use Symfony\Contracts\EventDispatcher\Event;

final class BottleTastedNotAuthorizeEvent extends Event
{
    public function __construct(
        public string $ownerId,
    ) {
    }
}
