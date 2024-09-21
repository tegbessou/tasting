<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Shared\Application\Query\AsQueryHandler;
use App\Tasting\Domain\Exception\ParticipantDoesntExistException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

#[AsQueryHandler]
final readonly class GetInvitationsQueryHandler
{
    public function __construct(
        private InvitationRepositoryInterface $invitationRepository,
        private ParticipantRepositoryInterface $participantRepository,
    ) {
    }

    public function __invoke(GetInvitationsQuery $query): InvitationRepositoryInterface
    {
        $invitationRepository = $this->invitationRepository;

        if ($query->targetEmail === null) {
            return $this->invitationRepository->sortCreatedAt();
        }

        $participant = $this->participantRepository->ofEmail(
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
