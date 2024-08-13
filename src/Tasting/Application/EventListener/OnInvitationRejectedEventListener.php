<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerServiceInterface;
use App\Tasting\Domain\Event\InvitationRejectedEvent;

final readonly class OnInvitationRejectedEventListener
{
    public function __construct(
        private MessageBrokerServiceInterface $messageBrokerService,
    ) {
    }

    public function __invoke(InvitationRejectedEvent $event): void
    {
        $this->messageBrokerService->dispatchInvitationRejected(
            $event,
        );
    }
}
