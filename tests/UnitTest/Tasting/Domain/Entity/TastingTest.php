<?php

declare(strict_types=1);

namespace UnitTest\Tasting\Domain\Entity;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingAcceptedException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingRejectedException;
use App\Tasting\Domain\Exception\InvitationMustNotBePendingException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use PHPUnit\Framework\TestCase;

final class TastingTest extends TestCase
{
    public function testCreate(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $this->assertInstanceOf(Tasting::class, $tasting);
        $this->assertEquals(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            $tasting->id(),
        );
        $this->assertEquals(
            BottleName::fromString('Château Margaux 2015'),
            $tasting->bottleName(),
        );
        $this->assertEquals(
            TastingParticipants::fromArray([
                '9964e539-05ff-4611-b39c-ffd6d108b8b7',
            ]),
            $tasting->participants(),
        );
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('12'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $this->assertInstanceOf(TastingCreated::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $tasting = Tasting::create(
            TastingId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $this->assertEmpty($tasting::getRecordedEvent()[0]);
    }

    public function testAcceptInvitation(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation->send();

        $tasting->acceptInvitation($invitation);

        $this->assertContains(
            $newParticipant->id()->value(),
            $tasting->participants()->values(),
        );

        $this->assertEquals(
            InvitationStatus::fromString('accepted'),
            $invitation->status(),
        );

        $tasting::eraseRecordedEvents();
        $invitation::eraseRecordedEvents();
    }

    public function testAcceptInvitationFailedBecauseInvitationNotSent(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();

        $this->expectException(InvitationMustBeSentBeforeBeingAcceptedException::class);

        $tasting->acceptInvitation($invitation);

        $tasting::eraseRecordedEvents();
        $invitation::eraseRecordedEvents();
    }

    public function testAcceptInvitationEventDispatch(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation->send();
        $invitation::eraseRecordedEvents();

        $tasting->acceptInvitation($invitation);

        $this->assertInstanceOf(InvitationAccepted::class, $invitation::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
        $invitation::eraseRecordedEvents();
    }

    public function testRemoveInvitation(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation->send();

        $tasting->acceptInvitation($invitation);
        $invitation::eraseRecordedEvents();

        $this->assertCount(1, $tasting->invitations());

        $tasting->removeInvitation($invitation);

        $this->assertCount(0, $tasting->invitations());
    }

    public function testRemoveInvitationNotAlreadySend(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation::eraseRecordedEvents();

        $this->assertCount(1, $tasting->invitations());

        $this->expectException(InvitationMustNotBePendingException::class);
        $tasting->removeInvitation($invitation);

        $this->assertCount(1, $tasting->invitations());
    }

    public function testRejectInvitation(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation->send();

        $tasting->rejectInvitation($invitation);

        $this->assertNotContains(
            $newParticipant->id()->value(),
            $tasting->participants()->values(),
        );

        $this->assertEquals(
            InvitationStatus::fromString('rejected'),
            $invitation->status(),
        );

        $tasting::eraseRecordedEvents();
        $invitation::eraseRecordedEvents();
    }

    public function testRejectInvitationFailedBecauseInvitationNotSent(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();

        $this->expectException(InvitationMustBeSentBeforeBeingRejectedException::class);

        $tasting->rejectInvitation($invitation);

        $tasting::eraseRecordedEvents();
        $invitation::eraseRecordedEvents();
    }

    public function testRejectInvitationEventDispatch(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->first();
        $invitation->send();
        $invitation::eraseRecordedEvents();

        $tasting->rejectInvitation($invitation);

        $this->assertInstanceOf(InvitationRejected::class, $invitation::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
        $invitation::eraseRecordedEvents();
    }
}
