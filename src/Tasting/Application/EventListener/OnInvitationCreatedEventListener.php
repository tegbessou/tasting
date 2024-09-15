<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerServiceInterface;
use App\Tasting\Domain\Event\InvitationCreatedEvent;

final readonly class OnInvitationCreatedEventListener
{
    public function __construct(
        private MessageBrokerServiceInterface $messageBrokerService,
    ) {
    }

    public function __invoke(InvitationCreatedEvent $event): void
    {
        $this->messageBrokerService->dispatchInvitationCreatedMessage(
            $event,
        );
    }
}
