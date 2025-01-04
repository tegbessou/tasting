<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\TastingDeleted;

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
