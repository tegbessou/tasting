<?php

declare(strict_types=1);

namespace UnitTest\Tasting\Domain\Entity;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationLink;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use PHPUnit\Framework\TestCase;

final class InvitationTest extends TestCase
{
    private Tasting $tasting;

    private InvitationTarget $target;

    #[\Override]
    protected function setUp(): void
    {
        $this->tasting = Tasting::create(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            Bottle::create(
                'Sassicaia 2012',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->tasting::eraseRecordedEvents();

        $this->target = InvitationTarget::fromString('root@gmail.com');
    }

    public function testCreate(): void
    {
        $tastingInvitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->target,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->assertInstanceOf(Invitation::class, $tastingInvitation);

        $this->assertEquals(
            'root@gmail.com',
            $tastingInvitation->target()->value(),
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
        $this->assertNotNull(
            $tastingInvitation->createdAt(),
        );
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Invitation::create(
            InvitationId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            $this->target,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Invitation::create(
            InvitationId::fromString('12'),
            $this->target,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );
    }

    public function testCreateFailedBadLink(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->target,
            InvitationLink::fromString('link'),
        );
    }

    public function testChangeStatus(): void
    {
        $invitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->target,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->assertEquals(InvitationStatus::fromString('pending'), $invitation->status());

        $invitation->changeStatus(InvitationStatus::fromString('accepted'));

        $this->assertEquals(InvitationStatus::fromString('accepted'), $invitation->status());
    }

    public function testSend(): void
    {
        $invitation = Invitation::create(
            InvitationId::fromString('190db0e2-6a9e-4e29-b3d9-3db8b1d0178d'),
            $this->target,
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
        );

        $this->assertNull($invitation->sentAt());

        $invitation->send();

        $this->assertNotNull($invitation->sentAt());
    }
}
