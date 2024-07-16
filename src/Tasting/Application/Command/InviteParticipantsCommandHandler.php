<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Exception\ParticipantsDontExistException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\Repository\TastingReadRepositoryInterface;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\Service\InviteParticipantService;
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
        $participantsDoesntExist = [];

        foreach ($command->participants as $participantId) {
            $participant = $this->participantReadRepository->ofId(
                $participantId,
            );

            if ($participant === null) {
                $participantsDoesntExist[] = $participantId;
            }

            $participants[] = $participant;
        }

        if ($participantsDoesntExist !== []) {
            throw new ParticipantsDontExistException($participantsDoesntExist);
        }

        $this->inviteParticipantService->canInviteParticipants(
            $tasting,
            $participants,
        );

        /** @var Participant $participant */
        foreach ($participants as $participant) {
            $invitation = Invitation::create(
                $this->invitationWriteRepository->nextIdentity(),
                $tasting,
                $participant,
                GetInvitationLinkService::getLink(),
            );

            $this->eventDispatcher->dispatch($invitation);

            $this->invitationWriteRepository->add($invitation);
        }
    }
}
