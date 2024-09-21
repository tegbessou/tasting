<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\InvitationRejected;

final readonly class OnInvitationRejected
{
    public function __construct(
        private MessageBrokerInterface $messageBrokerService,
    ) {
    }

    public function __invoke(InvitationRejected $event): void
    {
        $this->messageBrokerService->dispatchInvitationRejected(
            $event,
        );
    }
}
