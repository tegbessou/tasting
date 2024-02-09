<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Bottle\Domain\Entity;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleOwnerId;
use App\Bottle\Domain\ValueObject\BottlePicture;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use PHPUnit\Framework\TestCase;

final class BottleTest extends TestCase
{
    public function testCreate(): void
    {
        $bottle = Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );

        $this->assertInstanceOf(
            Bottle::class,
            $bottle,
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('12'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadNameTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadNameTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString(''),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadEstateNameTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadEstateNameTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString(''),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadWineType(): void
    {
        $this->expectException(\ValueError::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('yellow'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadYearToLess(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(1899),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadYearToMuch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2101),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadRateValue(): void
    {
        $this->expectException(\ValueError::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('top'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadOwnerId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('12'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadCountryTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadCountryTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString(''),
            BottlePrice::fromFloat(12.99),
        );
    }

    public function testCreateFailedBadPriceNegative(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(-12.99),
        );
    }

    public function testAddPicture(): void
    {
        $bottle = Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        )->addPicture(
            BottlePicture::fromString('/images/bottle/chateau-de-fonsalette.webp'),
        );

        $this->assertNotNull($bottle->picture());
    }

    public function testAddPictureFailedBottlePictureTooLong(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        )->addPicture(
            BottlePicture::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf'),
        );
    }

    public function testAddPictureFailedBottlePictureTooShort(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        )->addPicture(BottlePicture::fromString('/images/bottle/chateau-de-fonsalette.gif'));
    }

    public function testAddPictureFailedBottlePictureBadException(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            BottleOwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        )->addPicture(BottlePicture::fromString(''));
    }
}
