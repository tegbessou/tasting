<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use TegCorp\SharedKernelBundle\Application\Query\AsQueryHandler;

#[AsQueryHandler]
final readonly class GetInvitationsQueryHandler
{
    public function __construct(
        private InvitationAdapterInterface $invitationAdapter,
    ) {
    }

    public function __invoke(GetInvitationsQuery $query): InvitationAdapterInterface
    {
        $invitationRepository = $this->invitationAdapter;

        if ($query->targetEmail === null) {
            return $invitationRepository->sortCreatedAt();
        }

        $invitationRepository = $invitationRepository->sortCreatedAt();

        return $invitationRepository->withParticipant(
            $query->targetEmail,
        );
    }
}
