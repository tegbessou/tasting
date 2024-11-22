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
        $invitations = $this->invitationAdapter->withTarget(
            $event->targetId,
        );

        /** @var Invitation $invitation */
        foreach ($invitations->getIterator() as $invitation) {
            $invitation->targetFullName = $event->targetFullName;
        }

        $this->invitationAdapter->update();
    }
}
