<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Event;

use Symfony\Contracts\EventDispatcher\Event;

final class CheckOwnerExistEvent extends Event
{
    public function __construct(
        public string $ownerId,
    ) {
    }
}
