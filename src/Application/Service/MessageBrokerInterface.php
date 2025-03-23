<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Service;

use EmpireDesAmis\Tasting\Domain\Event\InvitationAccepted;
use EmpireDesAmis\Tasting\Domain\Event\InvitationRejected;
use EmpireDesAmis\Tasting\Domain\Event\TastingCreated;
use EmpireDesAmis\Tasting\Domain\Event\TastingDeleted;
use EmpireDesAmis\Tasting\Domain\Event\TastingParticipantInvited;

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
