<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Symfony\Messenger;

use App\Security\Application\Service\MessageBrokerServiceInterface;
use App\Security\Domain\Event\UserCreatedEvent;
use App\Security\Infrastructure\Symfony\Messenger\Message\UserCreatedMessage;
use Symfony\Component\Messenger\MessageBusInterface;

final readonly class MessengerBrokerService implements MessageBrokerServiceInterface
{
    public function __construct(
        private MessageBusInterface $eventBus,
    ) {
    }

    #[\Override]
    public function dispatchUserCreatedMessage(UserCreatedEvent $event): void
    {
        $this->eventBus->dispatch(
            UserCreatedMessage::fromEvent($event)
        );
    }
}
