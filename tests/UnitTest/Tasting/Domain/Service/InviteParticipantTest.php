<?php

declare(strict_types=1);

namespace UnitTest\Tasting\Domain\Service;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyParticipatingException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use PHPUnit\Framework\TestCase;

final class InviteParticipantTest extends TestCase
{
    private InvitationRepositoryInterface $invitationRepository;
    private Tasting $tasting;

    #[\Override]
    protected function setUp(): void
    {
        $invitationRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationRepository->method('nextIdentity')
            ->willReturn(
                InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            )
        ;

        $this->invitationRepository = $invitationRepository;

        $this->tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testInviteParticipants(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $participant = 'root@gmail.com';

        $this->assertCount(0, $this->tasting->invitations()->values());

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [
                $participant,
            ],
        );

        $this->tasting::eraseRecordedEvents();

        $this->assertCount(1, $this->tasting->invitations()->values());
    }

    public function testInviteParticipantsFailedOwnerCannotBeInvited(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $participant = 'hugues.gobet@gmail.com';

        $this->expectException(OwnerCannotBeInvitedToTastingException::class);

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [$participant],
        );

        $this->tasting::eraseRecordedEvents();
    }

    public function testInviteParticipantsFailedParticipantAlreadyInvited(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $newParticipant = 'root@gmail.com';

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [
                $newParticipant,
            ],
        );

        $this->expectException(ParticipantsAlreadyInvitedException::class);
        $this->expectExceptionMessage('Participants root@gmail.com are already invited');

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [$newParticipant],
        );

        $this->tasting::eraseRecordedEvents();
    }

    public function testInviteParticipantsFailedParticipantAlreadyParticipating(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $newParticipant = 'root@gmail.com';

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $this->tasting->invitations()->values()[0];
        $invitation->send();
        $this->tasting->acceptInvitation($invitation);

        $this->tasting->removeInvitation($invitation);

        $this->expectException(ParticipantsAlreadyParticipatingException::class);
        $this->expectExceptionMessage('Participants root@gmail.com are already participating');

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [$newParticipant],
        );

        $this->tasting::eraseRecordedEvents();
    }

    public function testInviteParticipantsThatDispatchEvent(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $participant = 'root@gmail.com';

        $inviteParticipantService->inviteParticipants(
            $this->tasting,
            [
                $participant,
            ],
        );

        $this->assertInstanceOf(TastingCreated::class, $this->tasting::getRecordedEvent()[0]);
        $this->tasting::eraseRecordedEvents();
    }
}
