<?php

declare(strict_types=1);

namespace App\Tasting\Application\EventListener;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use App\Tasting\Application\Event\TargetSetFullNameEvent;
use App\Tasting\Application\ReadModel\Invitation;

final readonly class OnTargetSetFullNameEventOnEachInvitationEventListener
{
    public function __construct(
        private InvitationAdapterInterface $invitationAdapter,
    ) {
    }

    public function __invoke(TargetSetFullNameEvent $event): void
    {
        $invitations = $this->invitationAdapter->withParticipant(
            $event->targetEmail,
        );

        /** @var Invitation $invitation */
        foreach ($invitations->getIterator() as $invitation) {
            $invitation->targetName = $event->targetFullName;
        }

        $this->invitationAdapter->update();
    }
}
