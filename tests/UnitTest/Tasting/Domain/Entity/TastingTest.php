<?php

declare(strict_types=1);

namespace UnitTest\Tasting\Domain\Entity;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\InvitationSent;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Event\TastingParticipantInvited;
use App\Tasting\Domain\Exception\InvitationAlreadySentException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingAcceptedException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingRejectedException;
use App\Tasting\Domain\Exception\InvitationMustNotBePendingException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use PHPUnit\Framework\TestCase;

final class TastingTest extends TestCase
{
    public function testCreate(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );
        $tasting::eraseRecordedEvents();

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
                'hugues.gobet@gmail.com',
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('12'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->assertEmpty($tasting::getRecordedEvent()[0]);
    }

    public function testSend(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];

        $tasting->sendInvitation($invitation);

        $this->assertNotNull($invitation->sentAt());

        $tasting::eraseRecordedEvents();
    }

    public function testSendAlreadySent(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];

        $tasting->sendInvitation($invitation);

        $this->assertNotNull($invitation->sentAt());

        $this->expectException(InvitationAlreadySentException::class);

        $tasting->sendInvitation($invitation);
    }

    public function testSendSuccessEventDispatch(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );
        $tasting::eraseRecordedEvents();

        $invitation = $tasting->invitations()->values()[0];

        $tasting->sendInvitation($invitation);

        $this->assertInstanceOf(InvitationSent::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }

    public function testSendFailedNoEventDispatch(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $tasting::eraseRecordedEvents();

        $invitation = $tasting->invitations()->values()[0];

        $tasting->sendInvitation($invitation);

        $this->expectException(InvitationAlreadySentException::class);

        $tasting->sendInvitation($invitation);

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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];
        $tasting->sendInvitation($invitation);

        $tasting->acceptInvitation($invitation);

        $this->assertContains(
            $newParticipant,
            $tasting->participants()->values(),
        );

        $this->assertEquals(
            InvitationStatus::fromString('accepted'),
            $invitation->status(),
        );

        $tasting::eraseRecordedEvents();
    }

    public function testAcceptInvitationNotAlreadySent(): void
    {
        $invitationWriteRepository = $this->createMock(InvitationRepositoryInterface::class);
        $invitationWriteRepository->method('nextIdentity')
            ->willReturn(InvitationId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'))
        ;

        $invitationService = new InviteParticipant($invitationWriteRepository);

        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];

        $this->expectException(InvitationMustBeSentBeforeBeingAcceptedException::class);

        $tasting->acceptInvitation($invitation);

        $tasting::eraseRecordedEvents();
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $tasting::eraseRecordedEvents();

        $invitation = $tasting->invitations()->values()[0];
        $tasting->sendInvitation($invitation);
        $tasting::eraseRecordedEvents();

        $tasting->acceptInvitation($invitation);

        $this->assertInstanceOf(InvitationAccepted::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];
        $tasting->sendInvitation($invitation);

        $tasting->acceptInvitation($invitation);

        $this->assertCount(1, $tasting->invitations()->values());

        $tasting->removeInvitation($invitation);

        $this->assertCount(0, $tasting->invitations()->values());
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );
        $tasting::eraseRecordedEvents();

        $invitation = $tasting->invitations()->values()[0];

        $this->assertCount(1, $tasting->invitations()->values());

        $this->expectException(InvitationMustNotBePendingException::class);
        $tasting->removeInvitation($invitation);

        $this->assertCount(1, $tasting->invitations()->values());
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];
        $tasting->sendInvitation($invitation);

        $tasting->rejectInvitation($invitation);

        $this->assertNotContains(
            $newParticipant,
            $tasting->participants()->values(),
        );

        $this->assertEquals(
            InvitationStatus::fromString('rejected'),
            $invitation->status(),
        );

        $tasting::eraseRecordedEvents();
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $invitation = $tasting->invitations()->values()[0];

        $this->expectException(InvitationMustBeSentBeforeBeingRejectedException::class);

        $tasting->rejectInvitation($invitation);

        $tasting::eraseRecordedEvents();
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
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $newParticipant = 'root@gmail.com';

        $invitationService->inviteParticipants(
            $tasting,
            [
                $newParticipant,
            ],
        );

        $tasting::eraseRecordedEvents();

        $invitation = $tasting->invitations()->values()[0];
        $tasting->sendInvitation($invitation);

        $tasting::eraseRecordedEvents();

        $tasting->rejectInvitation($invitation);

        $this->assertInstanceOf(InvitationRejected::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }

    public function testInvite(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $tasting->invite(
            InvitationId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $this->assertCount(1, $tasting->invitations()->values());

        /** @var Invitation $invitation */
        $invitation = $tasting->invitations()->values()[0];

        $this->assertEquals('aaa29ab4-e46f-4243-8b7c-20988f2fa25b', $invitation->id()->value());
        $this->assertEquals('root@gmail.com', $invitation->target()->value());

        $this->assertInstanceOf(TastingParticipantInvited::class, $tasting::getRecordedEvent()[0]);
        $this->assertEquals('aaa29ab4-e46f-4243-8b7c-20988f2fa25b', $tasting::getRecordedEvent()[0]->invitationId);
        $this->assertEquals('root@gmail.com', $tasting::getRecordedEvent()[0]->targetEmail);
        $this->assertNotNull($tasting::getRecordedEvent()[0]->link);
        $this->assertEquals('hugues.gobet@gmail.com', $tasting::getRecordedEvent()[0]->ownerEmail);
        $this->assertEquals('Château Margaux 2015', $tasting::getRecordedEvent()[0]->bottleName);

        $tasting::eraseRecordedEvents();
    }
}
