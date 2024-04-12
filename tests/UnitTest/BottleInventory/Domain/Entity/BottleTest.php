<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\BottleInventory\Domain\Entity;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Event\BottleCreatedEvent;
use App\BottleInventory\Domain\Event\BottleDeletedEvent;
use App\BottleInventory\Domain\Event\BottlePictureAddedEvent;
use App\BottleInventory\Domain\Event\BottleTastedEvent;
use App\BottleInventory\Domain\Event\BottleUpdatedEvent;
use App\BottleInventory\Domain\ValueObject\BottleCountry;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleGrapeVarieties;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottleOwnerId;
use App\BottleInventory\Domain\ValueObject\BottlePicture;
use App\BottleInventory\Domain\ValueObject\BottlePrice;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
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
            BottlePicture::fromString('chateau-de-fonsalette.webp'),
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
            BottlePicture::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf.png'),
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
        )->addPicture(BottlePicture::fromString('chateau-de-fonsalette.gif'));
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

    public function testTaste(): void
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

        $this->assertNull($bottle->tastedAt());

        $bottle->taste();

        $this->assertNotNull($bottle->tastedAt());
    }

    public function testCreateSuccessEventDispatch(): void
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

        $this->assertInstanceOf(BottleCreatedEvent::class, $bottle::getRecordedEvent()[0]);
        $bottle::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $bottle = Bottle::create(
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

        $this->assertEmpty($bottle::getRecordedEvent()[0]);
    }

    public function testPictureAddedSuccessEventDispatch(): void
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

        $bottle::eraseRecordedEvents();

        $bottle->addPicture(
            BottlePicture::fromString('chateau-de-fonsalette.webp'),
        );

        $this->assertInstanceOf(BottlePictureAddedEvent::class, $bottle::getRecordedEvent()[0]);
        $bottle::eraseRecordedEvents();
    }

    public function testPictureAddFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

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

        $bottle::eraseRecordedEvents();

        $bottle->addPicture(
            BottlePicture::fromString('iVvrNxngRgHFxDkHzimAvebLxJaKfmwxPxqVdqTfMVHLeUXWyxJVbGARSkbnegRPvrtJWrjvyTQfAqLUrNXWfrgPXxAwHYqbXzkDgXZRMTqkvFTtvXhAJkrqTHeqCQyEbtGhnJVcSyaNMvmMYwkSzHUhvFTFSCQjjAwjXvWZgdXunMyzNtfJjAkxAyhHjTrURubcAATTHRBfENQKLfHhjUCbhdErTUcGgDSVPSDqrPQcpAecNMpgeDMqncYtVeQf.png'),
        );

        $this->assertEmpty($bottle::getRecordedEvent()[0]);
    }

    public function testTasteSuccessEventDispatch(): void
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

        $bottle::eraseRecordedEvents();

        $bottle->taste();

        $this->assertInstanceOf(BottleTastedEvent::class, $bottle::getRecordedEvent()[0]);
        $bottle::eraseRecordedEvents();
    }

    public function testDeleteSuccessEventDispatch(): void
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

        $bottle::eraseRecordedEvents();

        $bottle->delete();

        $this->assertInstanceOf(BottleDeletedEvent::class, $bottle::getRecordedEvent()[0]);
        $bottle::eraseRecordedEvents();
    }

    public function testUpdate(): void
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

        $bottle::eraseRecordedEvents();

        $bottle->update(
            BottleName::fromString('Vouvray moelleux - cuvée constance'),
            BottleEstateName::fromString('Domaine Huet'),
            BottleWineType::fromString('white'),
            BottleYear::fromInt(2018),
            BottleGrapeVarieties::fromArray(['Chenin']),
            BottleRate::fromString('++'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(120.99),
        );

        $this->assertEquals('Vouvray moelleux - cuvée constance', $bottle->name()->value());
        $this->assertEquals('Domaine Huet', $bottle->estateName()->value());
        $this->assertEquals('white', $bottle->wineType()->value());
        $this->assertEquals(2018, $bottle->year()->value());
        $this->assertEquals(['Chenin'], $bottle->grapeVarieties()->values());
        $this->assertEquals('++', $bottle->rate()->value());
        $this->assertEquals('France', $bottle->country()->value());
        $this->assertEquals(120.99, $bottle->price()->amount());
    }

    public function testUpdateSuccessEventDispatch(): void
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

        $bottle::eraseRecordedEvents();

        $bottle->update(
            BottleName::fromString('Vouvray moelleux - cuvée constance'),
            BottleEstateName::fromString('Domaine Huet'),
            BottleWineType::fromString('white'),
            BottleYear::fromInt(2018),
            BottleGrapeVarieties::fromArray(['Chenin']),
            BottleRate::fromString('++'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(120.99),
        );

        $this->assertInstanceOf(BottleUpdatedEvent::class, $bottle::getRecordedEvent()[0]);
        $bottle::eraseRecordedEvents();
    }
}
