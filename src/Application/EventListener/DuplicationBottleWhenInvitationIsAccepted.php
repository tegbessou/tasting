<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\EventListener;

use EmpireDesAmis\Tasting\Application\Service\MessageBrokerInterface;
use EmpireDesAmis\Tasting\Domain\Event\InvitationAccepted;

final readonly class DuplicationBottleWhenInvitationIsAccepted
{
    public function __construct(
        private MessageBrokerInterface $messageBroker,
    ) {
    }

    public function __invoke(InvitationAccepted $event): void
    {
        $this->messageBroker->dispatchDuplicateBottleWhenInvitationIsAcceptedTastingDeleted(
            $event,
        );
    }
}
