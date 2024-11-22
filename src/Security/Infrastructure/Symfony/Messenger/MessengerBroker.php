<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Symfony\Messenger;

use App\Security\Application\Service\MessageBrokerInterface;
use App\Security\Domain\Event\UserCreated;
use App\Security\Infrastructure\Symfony\Messenger\Message\UserCreatedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBroker implements MessageBrokerInterface
{
    public function __construct(
        private MessageBusInterface $eventBus,
    ) {
    }

    #[\Override]
    public function dispatchUserCreatedMessage(UserCreated $event): void
    {
        $this->eventBus->dispatch(
            UserCreatedMessage::fromEvent($event)
        );
    }
}
