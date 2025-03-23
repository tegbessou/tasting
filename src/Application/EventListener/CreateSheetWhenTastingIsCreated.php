<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\EventListener;

use EmpireDesAmis\Tasting\Application\Service\MessageBrokerInterface;
use EmpireDesAmis\Tasting\Domain\Event\TastingCreated;

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
