<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Event\TastingDeleted;
use App\Tasting\Domain\Event\TastingParticipantInvited;

interface MessageBrokerInterface
{
    public function dispatchInvitationCreatedMessage(TastingParticipantInvited $event): void;

    public function dispatchInvitationAccepted(InvitationAccepted $event): void;

    public function dispatchInvitationRejected(InvitationRejected $event): void;

    public function dispatchCreateSheetWhenInvitationIsAccepted(InvitationAccepted $event): void;

    public function dispatchCreateSheetWhenTastingIsCreated(TastingCreated $event): void;

    public function dispatchTastingDeleted(TastingDeleted $event): void;

    public function dispatchDuplicateBottleWhenInvitationIsAcceptedTastingDeleted(InvitationAccepted $event): void;
}
