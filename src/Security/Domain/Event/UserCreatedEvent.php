<?php

declare(strict_types=1);

namespace App\Security\Domain\Event;

use App\Shared\Domain\Event\DomainEventInterface;

final class UserCreatedEvent implements DomainEventInterface
{
    public function __construct(
        public string $userEmail,
    ) {
    }
}
