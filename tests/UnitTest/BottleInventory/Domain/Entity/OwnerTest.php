<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\BottleInventory\Domain\Entity;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Event\OwnerCreated;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerFullName;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use PHPUnit\Framework\TestCase;

final class OwnerTest extends TestCase
{
    public function testCreate(): void
    {
        $owner = Owner::create(
            OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('Hugues Gobet'),
        );

        $this->assertInstanceOf(
            Owner::class,
            $owner,
        );
        $this->assertEquals(
            'e4c419fc-d31a-4655-a7d5-7b193c4b52e6',
            $owner->id()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $owner->email()->value(),
        );
        $this->assertEquals(
            'Hugues Gobet',
            $owner->fullName()->value(),
        );
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Owner::create(
            OwnerId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Owner::create(
            OwnerId::fromString('12'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateTooLongEmail(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Owner::create(
            OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            OwnerEmail::fromString('QeZO02mpilNEykfIKZxKPffEYGt1I2dJbWFFB1tDXeoJElKs2CzGCjTUHNF913cp0FFdHIkCLJFfBqIkti5VNhhTyxqOG5wm0ButpCURkwwf0IrwK6Rz8zFB3FJ8OfrDAnljVUONGQc86ttENSDPrFyRskfucvXrQOlJeYVwzxGfJn5EsOSi1lrK0JLYkBCR5EkNEz0hhEDC7UrF0hGHjVtUhVO1I3ReFlG4zWOIiqrdWVuD494Uc1qFqgTAi6Lv'),
            OwnerFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateNotAnEmail(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Owner::create(
            OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            OwnerEmail::fromString('hugues.gobet'),
            OwnerFullName::fromString('Hugues Gobet'),
        );
    }

    public function testCreateTooLongFullName(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Owner::create(
            OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('QeZO02mpilNEykfIKZxKPffEYGt1I2dJbWFFB1tDXeoJElKs2CzGCjTUHNF913cp0FFdHIkCLJFfBqIkti5VNhhTyxqOG5wm0ButpCURkwwf0IrwK6Rz8zFB3FJ8OfrDAnljVUONGQc86ttENSDPrFyRskfucvXrQOlJeYVwzxGfJn5EsOSi1lrK0JLYkBCR5EkNEz0hhEDC7UrF0hGHjVtUhVO1I3ReFlG4zWOIiqrdWVuD494Uc1qFqgTAi6Lv'),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $owner = Owner::create(
            OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('Hugues Gobet'),
        );

        $this->assertInstanceOf(OwnerCreated::class, $owner::getRecordedEvent()[0]);
        $owner::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $owner = Owner::create(
            OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('QeZO02mpilNEykfIKZxKPffEYGt1I2dJbWFFB1tDXeoJElKs2CzGCjTUHNF913cp0FFdHIkCLJFfBqIkti5VNhhTyxqOG5wm0ButpCURkwwf0IrwK6Rz8zFB3FJ8OfrDAnljVUONGQc86ttENSDPrFyRskfucvXrQOlJeYVwzxGfJn5EsOSi1lrK0JLYkBCR5EkNEz0hhEDC7UrF0hGHjVtUhVO1I3ReFlG4zWOIiqrdWVuD494Uc1qFqgTAi6Lv'),
        );

        $this->assertEmpty($owner::getRecordedEvent()[0]);
    }
}
