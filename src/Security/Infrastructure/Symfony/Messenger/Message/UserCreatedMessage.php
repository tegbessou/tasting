<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Symfony\Messenger\Message;

use App\Security\Domain\Event\UserCreatedEvent;

final readonly class UserCreatedMessage
{
    public function __construct(
        public string $email,
        public string $fullName,
    ) {
    }

    public static function fromEvent(
        UserCreatedEvent $event,
    ): self {
        return new self(
            $event->email,
            'Hugues Gobet',
        );
    }
}
