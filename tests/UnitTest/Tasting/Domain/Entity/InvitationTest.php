<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\Entity;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\InvitationCreatedEvent;
use App\Tasting\Domain\Event\InvitationSentEvent;
use App\Tasting\Domain\Exception\InvitationAlreadySentException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingAcceptedException;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationLink;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use PHPUnit\Framework\TestCase;

final class InvitationTest extends TestCase
{
    private Tasting $tasting;

    private Participant $participant;

    #[\Override]
    protected function setUp(): void
    {
        $this->tasting = Tasting::create(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            Participant::create(
                ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                ParticipantFullName::fromString('Hugues Gobet'),
            ),
        );

        $this->participant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );
    }

    public function testCreate(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->assertInstanceOf(Invitation::class, $tastingInvitation);

        $this->assertEquals(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            $tastingInvitation->subject()->id(),
        );
        $this->assertEquals(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            $tastingInvitation->target()->id(),
        );
        $this->assertEquals(
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
            $tastingInvitation->link(),
        );
        $this->assertEquals(
            InvitationStatus::fromString('pending'),
            $tastingInvitation->status(),
        );
        $this->assertNull(
            $tastingInvitation->sentAt(),
        );
        $this->assertNull(
            $tastingInvitation->updatedAt(),
        );

        $tastingInvitation::eraseRecordedEvents();
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Invitation::create(
            InvitationId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Invitation::create(
            InvitationId::fromString('12'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );
    }

    public function testCreateFailedBadLink(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('link'),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->assertInstanceOf(InvitationCreatedEvent::class, $tastingInvitation::getRecordedEvent()[0]);
        $tastingInvitation::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $invitation = Invitation::create(
            InvitationId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->assertEmpty($invitation::getRecordedEvent()[0]);
    }

    public function testSend(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $tastingInvitation->send();

        $this->assertNotNull($tastingInvitation->sentAt());

        $tastingInvitation::eraseRecordedEvents();
    }

    public function testSendAlreadySent(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $tastingInvitation::eraseRecordedEvents();

        $tastingInvitation->send();

        $this->assertNotNull($tastingInvitation->sentAt());

        $this->expectException(InvitationAlreadySentException::class);

        $tastingInvitation->send();
    }

    public function testSendSuccessEventDispatch(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );
        $tastingInvitation::eraseRecordedEvents();

        $tastingInvitation->send();

        $this->assertInstanceOf(InvitationSentEvent::class, $tastingInvitation::getRecordedEvent()[0]);
        $tastingInvitation::eraseRecordedEvents();
    }

    public function testSendFailedNoEventDispatch(): void
    {
        $invitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $invitation->send();
        $invitation::eraseRecordedEvents();

        $this->expectException(InvitationAlreadySentException::class);

        $invitation->send();

        $this->assertEmpty($invitation::getRecordedEvent()[0]);
    }

    public function testAcceptInvitation(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $tastingInvitation->send();

        $tastingInvitation->accept();

        $this->assertEquals(
            InvitationStatus::fromString('accepted'),
            $tastingInvitation->status(),
        );

        $tastingInvitation::eraseRecordedEvents();
    }

    public function testAcceptInvitationNotAlreadySent(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->expectException(InvitationMustBeSentBeforeBeingAcceptedException::class);

        $tastingInvitation->accept();

        $this->assertEquals(
            InvitationStatus::fromString('accepted'),
            $tastingInvitation->status(),
        );

        $tastingInvitation::eraseRecordedEvents();
    }

    public function testAcceptInvitationAlreadyAccept(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->tasting,
            $this->participant,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $tastingInvitation->send();

        $tastingInvitation->accept();

        $this->expectException(InvitationAlreadySentException::class);

        $tastingInvitation->accept();
    }
}
