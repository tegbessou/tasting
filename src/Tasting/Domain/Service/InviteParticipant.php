<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyParticipatingException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\ParticipantId;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class InviteParticipant
{
    public function __construct(
        private InvitationRepositoryInterface $invitationRepository,
    ) {
    }

    /**
     * @param string[] $participants
     */
    public function inviteParticipants(
        Tasting $tasting,
        array $participants,
    ): void {
        Assert::allEmail($participants);

        $this->canInviteParticipants($tasting, $participants);

        foreach ($participants as $participant) {
            $tasting->invite(
                $this->invitationRepository->nextIdentity(),
                InvitationTarget::fromString($participant),
            );
        }
    }

    private function canInviteParticipants(
        Tasting $tasting,
        array $participants,
    ): void {
        $this->isOwnerInList($participants, $tasting);
        $this->areAlreadyInvited($participants, $tasting);
        $this->areAlreadyParticipating($participants, $tasting);
    }

    private function isOwnerInList(array $participants, Tasting $tasting): void
    {
        if ($participants === []) {
            return;
        }

        foreach ($participants as $participant) {
            if ($tasting->ownerId()->value() !== $participant) {
                continue;
            }

            throw new OwnerCannotBeInvitedToTastingException();
        }
    }

    private function areAlreadyInvited(array $participants, Tasting $tasting): void
    {
        $participantsAlreadyInvited = [];

        foreach ($participants as $participant) {
            if (!$tasting->participantAlreadyInvited($participant)) {
                continue;
            }

            $participantsAlreadyInvited[] = $participant;
        }

        if ($participantsAlreadyInvited === []) {
            return;
        }

        throw new ParticipantsAlreadyInvitedException($participantsAlreadyInvited);
    }

    private function areAlreadyParticipating(array $participants, Tasting $tasting): void
    {
        $participantsAlreadyParticipating = [];

        /** @var string $participant */
        foreach ($participants as $participant) {
            if (!$tasting->participants()->contains(ParticipantId::fromString($participant))) {
                continue;
            }

            $participantsAlreadyParticipating[] = $participant;
        }

        if ($participantsAlreadyParticipating === []) {
            return;
        }

        throw new ParticipantsAlreadyParticipatingException($participantsAlreadyParticipating);
    }
}
