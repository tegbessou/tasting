<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerServiceInterface;
use App\Tasting\Domain\Event\InvitationAcceptedEvent;

final readonly class OnInvitationAcceptedEventListener
{
    public function __construct(
        private MessageBrokerServiceInterface $messageBrokerService,
    ) {
    }

    public function __invoke(InvitationAcceptedEvent $event): void
    {
        $this->messageBrokerService->dispatchInvitationAccepted(
            $event,
        );
    }
}
