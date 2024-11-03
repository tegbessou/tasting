<?php

declare(strict_types=1);

namespace UnitTest\Country\Domain\Entity;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use PHPUnit\Framework\TestCase;

final class CountryTest extends TestCase
{
    public function testCreateSuccess(): void
    {
        $country = Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            CountryName::fromString('France2'),
        );

        $this->assertInstanceOf(
            Country::class,
            $country,
        );
        $this->assertEquals(
            'af785dbb-4ac1-4786-a5aa-1fed08f6ec26',
            $country->id()->value(),
        );
        $this->assertEquals(
            'France2',
            $country->name()->value(),
        );
    }

    public function testCreateFailedWithBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            CountryName::fromString('France2'),
        );
    }

    public function testCreateFailedWithBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('2'),
            CountryName::fromString('France2'),
        );
    }

    public function testCreateFailedWithBadNameTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            CountryName::fromString(''),
        );
    }

    public function testCreateFailedWithBadNameTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            CountryName::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
        );
    }

    public function testCreateFailedEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $country = Country::create(
            CountryId::fromString('2'),
            CountryName::fromString('France2'),
        );

        $this->assertEmpty($country::getRecordedEvent());
    }
}
