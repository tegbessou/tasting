<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Messenger;

use App\BottleInventory\Application\Service\MessageBrokerServiceInterface;
use App\BottleInventory\Domain\Event\BottleTastedEvent;
use App\BottleInventory\Infrastructure\Symfony\Messenger\Message\BottleTastedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBrokerService implements MessageBrokerServiceInterface
{
    public function __construct(
        private MessageBusInterface $messageBus,
    ) {
    }

    #[\Override]
    public function dispatchBottleTastedMessage(BottleTastedEvent $event): void
    {
        $this->messageBus->dispatch(
            BottleTastedMessage::fromEvent($event)
        );
    }
}
