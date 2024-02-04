<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Bottle\Domain\Entity;

use App\Bottle\Domain\Entity\GrapeVariety;
use App\Bottle\Domain\ValueObject\GrapeVarietyId;
use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use PHPUnit\Framework\TestCase;

final class GrapeVarietyTest extends TestCase
{
    public function testCreateSuccess(): void
    {
        $grapeVariety = GrapeVariety::create(
            GrapeVarietyId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            GrapeVarietyName::fromString('Name'),
        );

        $this->assertInstanceOf(
            GrapeVariety::class,
            $grapeVariety,
        );
    }

    public function testCreateBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        GrapeVariety::create(
            GrapeVarietyId::fromString('12'),
            GrapeVarietyName::fromString('Name'),
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
}
