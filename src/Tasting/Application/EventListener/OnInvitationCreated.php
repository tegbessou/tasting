<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\TastingParticipantInvited;

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
