<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\BottleInventory\Domain\Entity;

use App\BottleInventory\Domain\Entity\GrapeVariety;
use App\BottleInventory\Domain\Event\GrapeVarietyCreatedEvent;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyId;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;
use PHPUnit\Framework\TestCase;

final class GrapeVarietyTest extends TestCase
{
    public function testCreateSuccess(): void
    {
        $grapeVariety = GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            GrapeVarietyName::fromString('Sirano'),
        );

        $this->assertInstanceOf(
            GrapeVariety::class,
            $grapeVariety,
        );
    }

    public function testCreateBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            GrapeVarietyName::fromString('Selenor'),
        );
    }

    public function testCreateBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        GrapeVariety::create(
            GrapeVarietyId::fromString('12'),
            GrapeVarietyName::fromString('Selenor'),
        );
    }

    public function testCreateBadNameTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            GrapeVarietyName::fromString(''),
        );
    }

    public function testCreateBadNameTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            GrapeVarietyName::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $grapeVariety = GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            GrapeVarietyName::fromString('Sirano'),
        );

        $this->assertInstanceOf(GrapeVarietyCreatedEvent::class, $grapeVariety::getRecordedEvent()[0]);
        $grapeVariety::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $grapeVariety = GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            GrapeVarietyName::fromString(''),
        );

        $this->assertEmpty($grapeVariety::getRecordedEvent()[0]);
    }
}
