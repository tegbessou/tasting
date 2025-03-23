<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\EventListener;

use EmpireDesAmis\Tasting\Application\Service\MessageBrokerInterface;
use EmpireDesAmis\Tasting\Domain\Event\TastingParticipantInvited;

final readonly class OnInvitationCreated
{
    public function __construct(
        private MessageBrokerInterface $messageBrokerService,
    ) {
    }

    public function __invoke(TastingParticipantInvited $event): void
    {
        $this->messageBrokerService->dispatchInvitationCreatedMessage(
            $event,
        );
    }
}
