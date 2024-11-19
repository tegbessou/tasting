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

final class InviteParticipantServiceTest extends TestCase
{
    private InvitationRepositoryInterface $invitationRepository;

    #[\Override]
    protected function setUp(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(
                InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            )
        ;

        $this->invitationRepository = $invitationWriteRepository;
    }

    public function testInviteParticipants(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $owner = 'hugues.gobet@gmail.com';

        $participant = 'root@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString($owner),
        );

        $this->assertCount(0, $tasting->invitations()->values());

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $participant,
            ],
        );

        $this->assertCount(1, $tasting->invitations()->values());
    }

    public function testInviteParticipantsFailedOwnerCannotBeInvited(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $participant = 'hugues.gobet@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->expectException(OwnerCannotBeInvitedToTastingException::class);

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [$participant],
        );
    }

    public function testInviteParticipantsFailedParticipantAlreadyInvited(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $participant = 'hugues.gobet@gmail.com';

        $newParticipant = 'root@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString($participant),
        );

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $this->expectException(ParticipantsAlreadyInvitedException::class);
        $this->expectExceptionMessage('Participants root@gmail.com are already invited');

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [$newParticipant],
        );
    }

    public function testInviteParticipantsFailedParticipantAlreadyParticipating(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $participant = 'hugues.gobet@gmail.com';

        $newParticipant = 'root@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString($participant),
        );

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];
        $invitation->send();
        $tasting->acceptInvitation($invitation);

        $tasting->removeInvitation($invitation);

        $this->expectException(ParticipantsAlreadyParticipatingException::class);
        $this->expectExceptionMessage('Participants root@gmail.com are already participating');

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [$newParticipant],
        );
    }

    public function testInviteParticipantsThatDispatchEvent(): void
    {
        $inviteParticipantService = new InviteParticipant(
            $this->invitationRepository,
        );

        $owner = 'hugues.gobet@gmail.com';

        $participant = 'root@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString($owner),
        );

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $participant,
            ],
        );

        $this->assertInstanceOf(TastingCreated::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }
}
