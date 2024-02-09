<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Country\Domain\Entity;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use PHPUnit\Framework\TestCase;

final class CountryTest extends TestCase
{
    public function testCreateSuccess(): void
    {
        $user = Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            CountryName::fromString('France2'),
        );

        $this->assertInstanceOf(
            Country::class,
            $user,
        );
    }

    public function testCreateSuccessWithBadUuid(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('2'),
            CountryName::fromString('France2'),
        );
    }

    public function testCreateSuccessWithBadNameTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            CountryName::fromString(''),
        );
    }

    public function testCreateSuccessWithBadNameTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Country::create(
            CountryId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            CountryName::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
        );
    }
}
