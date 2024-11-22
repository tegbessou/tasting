<?php

declare(strict_types=1);

namespace App\Security\Application\Service;

use App\Security\Domain\Event\UserCreated;

interface MessageBrokerInterface
{
    public function dispatchUserCreatedMessage(UserCreated $event): void;
}
