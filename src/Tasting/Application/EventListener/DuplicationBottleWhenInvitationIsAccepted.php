<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\InvitationAccepted;

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
