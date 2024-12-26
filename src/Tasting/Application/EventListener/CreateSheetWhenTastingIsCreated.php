<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Service\MessageBrokerInterface;
use App\Tasting\Domain\Event\TastingCreated;

final readonly class CreateSheetWhenTastingIsCreated
{
    public function __construct(
        private MessageBrokerInterface $messageBroker,
    ) {
    }

    public function __invoke(TastingCreated $event): void
    {
        $this->messageBroker->dispatchCreateSheetWhenTastingIsCreated(
            $event,
        );
    }
}
