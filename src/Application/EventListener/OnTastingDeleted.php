<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\EventListener;

use EmpireDesAmis\Tasting\Application\Service\MessageBrokerInterface;
use EmpireDesAmis\Tasting\Domain\Event\TastingDeleted;

final readonly class OnTastingDeleted
{
    public function __construct(
        private MessageBrokerInterface $messageBrokerService,
    ) {
    }

    public function __invoke(TastingDeleted $event): void
    {
        $this->messageBrokerService->dispatchTastingDeleted(
            $event,
        );
    }
}
