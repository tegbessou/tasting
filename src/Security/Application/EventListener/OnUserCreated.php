<?php

declare(strict_types=1);

namespace App\Security\Application\EventListener;

use App\Security\Application\Service\MessageBrokerServiceInterface;
use App\Security\Domain\Event\UserCreated;

final readonly class OnUserCreated
{
    public function __construct(
        private MessageBrokerServiceInterface $messageBrokerService,
    ) {
    }

    public function __invoke(UserCreated $event): void
    {
        $this->messageBrokerService->dispatchUserCreatedMessage(
            $event,
        );
    }
}
