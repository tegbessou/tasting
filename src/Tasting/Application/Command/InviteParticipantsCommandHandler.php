<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipant;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\TastingId;

#[AsCommandHandler]
final readonly class InviteParticipantsCommandHandler
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private ParticipantRepositoryInterface $participantRepository,
        private InviteParticipant $inviteParticipantService,
        private InvitationRepositoryInterface $invitationRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(InviteParticipantsCommand $command): void
    {
        $tasting = $this->tastingRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        $participants = [];

        foreach ($command->participantsEmail as $participantEmail) {
            $participant = $this->participantRepository->ofEmail(
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
            $this->invitationRepository->add($invitation);

            $this->eventDispatcher->dispatch($invitation);
        }

        $this->eventDispatcher->dispatch($tasting);
    }

    public function createParticipantIfNotExist(ParticipantEmail $participantEmail): Participant
    {
        $newParticipant = Participant::createAnonymous(
            $this->participantRepository->nextIdentity(),
            $participantEmail,
        );

        $this->eventDispatcher->dispatch($newParticipant);

        $this->participantRepository->add($newParticipant);

        return $newParticipant;
    }
}
