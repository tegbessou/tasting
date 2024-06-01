<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\Entity;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\TastingCreatedEvent;
use App\Tasting\Domain\Event\TastingParticipantsInvitedEvent;
use App\Tasting\Domain\ValueObject\BottleId;
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
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $this->assertInstanceOf(Tasting::class, $tasting);
        $this->assertEquals(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            $tasting->id(),
        );
        $this->assertEquals(
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            $tasting->bottleId(),
        );
        $this->assertEquals(
            TastingParticipants::fromArray([
                'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
            ]),
            $tasting->participants(),
        );
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('12'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );
    }

    public function testCreateFailedBadBottleIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );
    }

    public function testCreateFailedBadBottleId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('12'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );
    }

    public function testCreateFailedBadTastingOwnerIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
        );
    }

    public function testCreateFailedBadTastingOwnerId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('12'),
        );
    }

    public function testInviteParticipants(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $tasting->inviteParticipants(['05e8984e-45cd-44d4-8d42-f5c4e6bd6192']);

        $this->assertEquals(
            TastingParticipants::fromArray([
                'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                '05e8984e-45cd-44d4-8d42-f5c4e6bd6192',
            ]),
            $tasting->participants(),
        );
    }

    public function testInviteMultipleParticipants(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $tasting->inviteParticipants([
            '05e8984e-45cd-44d4-8d42-f5c4e6bd6192',
            '15863a42-a737-43c8-8bb9-2d448eb47300',
        ]);

        $this->assertEquals(
            TastingParticipants::fromArray([
                'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                '05e8984e-45cd-44d4-8d42-f5c4e6bd6192',
                '15863a42-a737-43c8-8bb9-2d448eb47300',
            ]),
            $tasting->participants(),
        );
    }

    public function testInviteParticipantsBadParticipantsIdLength(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $this->expectException(\InvalidArgumentException::class);

        $tasting->inviteParticipants(['af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26']);
    }

    public function testInviteParticipantsBadParticipantsId(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $this->expectException(\InvalidArgumentException::class);

        $tasting->inviteParticipants(['12']);
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $this->assertInstanceOf(TastingCreatedEvent::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $tasting = Tasting::create(
            TastingId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $this->assertEmpty($tasting::getRecordedEvent()[0]);
    }

    public function testInviteParticipantsSuccessEventDispatch(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $tasting::eraseRecordedEvents();

        $tasting->inviteParticipants([
            '05e8984e-45cd-44d4-8d42-f5c4e6bd6192',
        ]);

        $this->assertInstanceOf(TastingParticipantsInvitedEvent::class, $tasting::getRecordedEvent()[0]);
        $tasting::eraseRecordedEvents();
    }

    public function testParticipantsInvitedFailedNoEventDispatch(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('ee4fd98c-4427-42c1-bb70-08f6d92377c9'),
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
            TastingOwnerId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
        );

        $tasting::eraseRecordedEvents();

        $this->expectException(\InvalidArgumentException::class);

        $tasting->inviteParticipants(['af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26']);

        $this->assertEmpty($tasting::getRecordedEvent()[0]);
    }
}
