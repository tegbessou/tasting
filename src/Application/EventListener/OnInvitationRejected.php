<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\EventListener;

use EmpireDesAmis\Tasting\Application\Service\MessageBrokerInterface;
use EmpireDesAmis\Tasting\Domain\Event\InvitationRejected;

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
