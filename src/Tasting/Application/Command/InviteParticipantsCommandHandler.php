<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantWriteRepositoryInterface;
use App\Tasting\Domain\Repository\TastingReadRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipantService;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\TastingId;

#[AsCommandHandler]
final readonly class InviteParticipantsCommandHandler
{
    public function __construct(
        private TastingReadRepositoryInterface $tastingReadRepository,
        private ParticipantReadRepositoryInterface $participantReadRepository,
        private InviteParticipantService $inviteParticipantService,
        private InvitationWriteRepositoryInterface $invitationWriteRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
        private ParticipantWriteRepositoryInterface $participantWriteRepository,
    ) {
    }

    public function __invoke(InviteParticipantsCommand $command): void
    {
        $tasting = $this->tastingReadRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        $participants = [];

        foreach ($command->participantsEmail as $participantEmail) {
            $participant = $this->participantReadRepository->ofEmail(
                $participantEmail,
            );

            if ($participant === null) {
                $participant = $this->createParticipantIfNotExist($participantEmail);
            }

            $participants[] = $participant;
        }

        $this->inviteParticipantService->inviteParticipants(
            $tasting,
            $participants,
        );

        foreach ($tasting->invitations() as $invitation) {
            $this->invitationWriteRepository->add($invitation);

            $this->eventDispatcher->dispatch($invitation);
        }

        $this->eventDispatcher->dispatch($tasting);
    }

    public function createParticipantIfNotExist(ParticipantEmail $participantEmail): Participant
    {
        $newParticipant = Participant::createAnonymous(
            $this->participantWriteRepository->nextIdentity(),
            $participantEmail,
        );

        $this->eventDispatcher->dispatch($newParticipant);

        $this->participantWriteRepository->add($newParticipant);

        return $newParticipant;
    }
}
