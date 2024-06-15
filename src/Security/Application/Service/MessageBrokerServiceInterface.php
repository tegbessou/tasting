<?php

declare(strict_types=1);

namespace App\Security\Application\Service;

use App\Security\Domain\Event\UserCreatedEvent;

interface MessageBrokerServiceInterface
{
    public function dispatchUserCreatedMessage(UserCreatedEvent $event): void;
}
