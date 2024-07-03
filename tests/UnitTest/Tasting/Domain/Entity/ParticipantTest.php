<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\Entity;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Event\ParticipantCreatedEvent;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use PHPUnit\Framework\TestCase;

final class ParticipantTest extends TestCase
{
    public function testCreate(): void
    {
        $participant = Participant::create(
            ParticipantId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $this->assertInstanceOf(
            Participant::class,
            $participant,
        );
        $this->assertEquals(
            'e4c419fc-d31a-4655-a7d5-7b193c4b52e6',
            $participant->id()->id(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $participant->email()->value(),
        );
        $this->assertEquals(
            'Hugues Gobet',
            $participant->fullName()->value(),
        );
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Participant::create(
            ParticipantId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Participant::create(
            ParticipantId::fromString('12'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateTooLongEmail(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Participant::create(
            ParticipantId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            ParticipantEmail::fromString('QeZO02mpilNEykfIKZxKPffEYGt1I2dJbWFFB1tDXeoJElKs2CzGCjTUHNF913cp0FFdHIkCLJFfBqIkti5VNhhTyxqOG5wm0ButpCURkwwf0IrwK6Rz8zFB3FJ8OfrDAnljVUONGQc86ttENSDPrFyRskfucvXrQOlJeYVwzxGfJn5EsOSi1lrK0JLYkBCR5EkNEz0hhEDC7UrF0hGHjVtUhVO1I3ReFlG4zWOIiqrdWVuD494Uc1qFqgTAi6Lv'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateNotAnEmail(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Participant::create(
            ParticipantId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            ParticipantEmail::fromString('hugues.gobet'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateTooLongFullName(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Participant::create(
            ParticipantId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('QeZO02mpilNEykfIKZxKPffEYGt1I2dJbWFFB1tDXeoJElKs2CzGCjTUHNF913cp0FFdHIkCLJFfBqIkti5VNhhTyxqOG5wm0ButpCURkwwf0IrwK6Rz8zFB3FJ8OfrDAnljVUONGQc86ttENSDPrFyRskfucvXrQOlJeYVwzxGfJn5EsOSi1lrK0JLYkBCR5EkNEz0hhEDC7UrF0hGHjVtUhVO1I3ReFlG4zWOIiqrdWVuD494Uc1qFqgTAi6Lv'),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $participant = Participant::create(
            ParticipantId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $this->assertInstanceOf(ParticipantCreatedEvent::class, $participant::getRecordedEvent()[0]);
        $participant::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $participant = Participant::create(
            ParticipantId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('QeZO02mpilNEykfIKZxKPffEYGt1I2dJbWFFB1tDXeoJElKs2CzGCjTUHNF913cp0FFdHIkCLJFfBqIkti5VNhhTyxqOG5wm0ButpCURkwwf0IrwK6Rz8zFB3FJ8OfrDAnljVUONGQc86ttENSDPrFyRskfucvXrQOlJeYVwzxGfJn5EsOSi1lrK0JLYkBCR5EkNEz0hhEDC7UrF0hGHjVtUhVO1I3ReFlG4zWOIiqrdWVuD494Uc1qFqgTAi6Lv'),
        );

        $this->assertEmpty($participant::getRecordedEvent()[0]);
    }
}
