<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\Service;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\TastingCreatedEvent;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyParticipatingException;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipantService;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use PHPUnit\Framework\TestCase;

final class InviteParticipantServiceTest extends TestCase
{
    private InvitationWriteRepositoryInterface $invitationWriteRepository;

    #[\Override]
    protected function setUp(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationWriteRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(
                InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            )
        ;

        $this->invitationWriteRepository = $invitationWriteRepository;
    }

    public function testInviteParticipants(): void
    {
        $inviteParticipantService = new InviteParticipantService(
            $this->invitationWriteRepository,
        );

        $owner = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $participant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $owner,
        );

        $this->assertCount(0, $tasting->invitations());

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $participant,
            ],
        );

        $this->assertCount(1, $tasting->invitations());
    }

    public function testInviteParticipantsFailedOwnerCannotBeInvited(): void
    {
        $inviteParticipantService = new InviteParticipantService(
            $this->invitationWriteRepository,
        );

        $participant = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $participant,
        );

        $this->expectException(OwnerCannotBeInvitedToTastingException::class);

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [$participant],
        );
    }

    public function testInviteParticipantsFailedParticipantAlreadyInvited(): void
    {
        $inviteParticipantService = new InviteParticipantService(
            $this->invitationWriteRepository,
        );

        $participant = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $participant,
        );

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $this->expectException(ParticipantsAlreadyInvitedException::class);
        $this->expectExceptionMessage('Participants Root are already invited');

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [$newParticipant],
        );
    }

    public function testInviteParticipantsFailedParticipantAlreadyParticipating(): void
    {
        $inviteParticipantService = new InviteParticipantService(
            $this->invitationWriteRepository,
        );

        $participant = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $participant,
        );

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation->send();
        $invitation->accept();

        $this->expectException(ParticipantsAlreadyParticipatingException::class);
        $this->expectExceptionMessage('Participants Root are already invited');

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [$newParticipant],
        );
    }

    public function testInviteParticipantsThatDispatchEvent(): void
    {
        $inviteParticipantService = new InviteParticipantService(
            $this->invitationWriteRepository,
        );

        $owner = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $participant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $owner,
        );

        $inviteParticipantService->inviteParticipants(
            $tasting,
            [
                $participant,
            ],
        );

        $this->assertInstanceOf(TastingCreatedEvent::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }
}
