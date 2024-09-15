<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Shared\Application\Query\AsQueryHandler;
use App\Tasting\Domain\Exception\ParticipantDoesntExistException;
use App\Tasting\Domain\Repository\InvitationReadRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

#[AsQueryHandler]
final readonly class GetInvitationsQueryHandler
{
    public function __construct(
        private InvitationReadRepositoryInterface $invitationReadRepository,
        private ParticipantReadRepositoryInterface $participantReadRepository,
    ) {
    }

    public function __invoke(GetInvitationsQuery $query): InvitationReadRepositoryInterface
    {
        $invitationRepository = $this->invitationReadRepository;

        if ($query->targetEmail === null) {
            return $this->invitationReadRepository->sortCreatedAt();
        }

        $participant = $this->participantReadRepository->ofEmail(
            ParticipantEmail::fromString($query->targetEmail),
        );

        if ($participant === null) {
            throw new ParticipantDoesntExistException($query->targetEmail);
        }

        $invitationRepository = $invitationRepository->sortCreatedAt();

        return $invitationRepository->withParticipant(
            $participant->id(),
        );
    }
}
