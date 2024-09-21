<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\EventListener;

use App\BottleInventory\Application\Service\MessageBrokerInterface;
use App\BottleInventory\Domain\Event\BottleTasted;

final readonly class OnBottleTasted
{
    public function __construct(
        private MessageBrokerInterface $messageBrokerService,
    ) {
    }

    public function __invoke(BottleTasted $event): void
    {
        $this->messageBrokerService->dispatchBottleTastedMessage(
            $event,
        );
    }
}
