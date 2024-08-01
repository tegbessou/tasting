<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

use App\Tasting\Domain\Event\InvitationCreatedEvent;

interface MessageBrokerServiceInterface
{
    public function dispatchInvitationCreatedMessage(InvitationCreatedEvent $event): void;
}
