<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\TastingParticipantsInvitedEvent;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyParticipatingException;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;

final readonly class InviteParticipantService
{
    public function __construct(
        private InvitationWriteRepositoryInterface $invitationWriteRepository,
    ) {
    }

    public function inviteParticipants(
        Tasting $tasting,
        array $participants,
    ): void {
        Assert::allIsInstanceOf($participants, Participant::class);

        $this->canInviteParticipants($tasting, $participants);

        /** @var Participant $participant */
        foreach ($participants as $participant) {
            $invitation = Invitation::create(
                $this->invitationWriteRepository->nextIdentity(),
                $tasting,
                $participant,
                GetInvitationLinkService::getLink(),
            );

            $tasting->invitations()->add($invitation);
        }

        $tasting::recordEvent(
            new TastingParticipantsInvitedEvent(
                $tasting->id()->value(),
            )
        );
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
            if ($tasting->owner()->id()->value() !== $participant->id()->value()) {
                continue;
            }

            throw new OwnerCannotBeInvitedToTastingException();
        }
    }

    private function areAlreadyInvited(array $participants, Tasting $tasting): void
    {
        $participantsAlreadyInvited = [];

        /** @var Participant $participant */
        foreach ($participants as $participant) {
            if (!$tasting->participantAlreadyInvited($participant)) {
                continue;
            }

            $participantsAlreadyInvited[] = $participant->fullName()->value();
        }

        if ($participantsAlreadyInvited === []) {
            return;
        }

        throw new ParticipantsAlreadyInvitedException($participantsAlreadyInvited);
    }

    private function areAlreadyParticipating(array $participants, Tasting $tasting): void
    {
        $participantsAlreadyParticipating = [];

        /** @var Participant $participant */
        foreach ($participants as $participant) {
            if (!$tasting->participants()->contains($participant)) {
                continue;
            }

            $participantsAlreadyParticipating[] = $participant->fullName()->value();
        }

        if ($participantsAlreadyParticipating === []) {
            return;
        }

        throw new ParticipantsAlreadyParticipatingException($participantsAlreadyParticipating);
    }
}
