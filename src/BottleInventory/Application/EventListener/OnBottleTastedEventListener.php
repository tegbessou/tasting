<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\EventListener;

use App\BottleInventory\Application\Service\MessageBrokerServiceInterface;
use App\BottleInventory\Domain\Event\BottleTastedEvent;

final readonly class OnBottleTastedEventListener
{
    public function __construct(
        private MessageBrokerServiceInterface $messageBrokerService,
    ) {
    }

    public function __invoke(BottleTastedEvent $event): void
    {
        $this->messageBrokerService->dispatchBottleTastedMessage(
            $event,
        );
    }
}
