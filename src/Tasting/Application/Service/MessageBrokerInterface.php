<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationCreated;
use App\Tasting\Domain\Event\InvitationRejected;

interface MessageBrokerInterface
{
    public function dispatchInvitationCreatedMessage(InvitationCreated $event): void;

    public function dispatchInvitationAccepted(InvitationAccepted $event): void;

    public function dispatchInvitationRejected(InvitationRejected $event): void;
}
