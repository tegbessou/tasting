<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Messenger;

use App\BottleInventory\Application\Service\MessageBrokerInterface;
use App\BottleInventory\Domain\Event\BottleTasted;
use App\BottleInventory\Infrastructure\Symfony\Messenger\Message\BottleTastedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBroker implements MessageBrokerInterface
{
    public function __construct(
        private MessageBusInterface $eventBus,
    ) {
    }

    #[\Override]
    public function dispatchBottleTastedMessage(BottleTasted $event): void
    {
        $this->eventBus->dispatch(
            BottleTastedMessage::fromEvent($event)
        );
    }
}
