<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\BottleInventory\Domain\Entity;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Event\BottleCreated;
use App\BottleInventory\Domain\Event\BottleDeleted;
use App\BottleInventory\Domain\Event\BottlePictureAdded;
use App\BottleInventory\Domain\Event\BottleTasted;
use App\BottleInventory\Domain\Event\BottleUpdated;
use App\BottleInventory\Domain\ValueObject\BottleCountry;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleGrapeVarieties;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottlePicture;
use App\BottleInventory\Domain\ValueObject\BottlePrice;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerFullName;
use App\BottleInventory\Domain\ValueObject\OwnerId;
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );

        $this->assertInstanceOf(
            Bottle::class,
            $bottle,
        );
        $this->assertEquals(
            'af785dbb-4ac1-4786-a5aa-1fed08f6ec26',
            $bottle->id()->value(),
        );
        $this->assertEquals(
            'Château de Fonsalette',
            $bottle->name()->value(),
        );
        $this->assertEquals(
            'Château Rayas',
            $bottle->estateName()->value(),
        );
        $this->assertEquals(
            'red',
            $bottle->wineType()->value(),
        );
        $this->assertEquals(
            2000,
            $bottle->year()->value(),
        );
        $this->assertEquals(
            ['Grenache', 'Cinsault', 'Syrah'],
            $bottle->grapeVarieties()->values(),
        );
        $this->assertEquals(
            'xs',
            $bottle->rate()->value(),
        );
        $this->assertEquals(
            'e4c419fc-d31a-4655-a7d5-7b193c4b52e6',
            $bottle->owner()->id()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $bottle->owner()->email()->value(),
        );
        $this->assertEquals(
            'Hugues Gobet',
            $bottle->owner()->fullName()->value(),
        );
        $this->assertEquals(
            'France',
            $bottle->country()->value(),
        );
        $this->assertEquals(
            12.99,
            $bottle->price()->amount(),
        );
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Bottle::create(
            BottleId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            BottleName::fromString('Château de Fonsalette'),
            BottleEstateName::fromString('Château Rayas'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2000),
            BottleGrapeVarieties::fromArray(['Grenache', 'Cinsault', 'Syrah']),
            BottleRate::fromString('xs'),
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        )->addPicture(
            BottlePicture::fromString('chateau-de-fonsalette.webp'),
        );

        $this->assertEquals($bottle->picture()->path(), 'chateau-de-fonsalette.webp');
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );

        $this->assertInstanceOf(BottleCreated::class, $bottle::getRecordedEvent()[0]);
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );

        $bottle::eraseRecordedEvents();

        $bottle->addPicture(
            BottlePicture::fromString('chateau-de-fonsalette.webp'),
        );

        $this->assertInstanceOf(BottlePictureAdded::class, $bottle::getRecordedEvent()[0]);
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );

        $bottle::eraseRecordedEvents();

        $bottle->taste();

        $this->assertInstanceOf(BottleTasted::class, $bottle::getRecordedEvent()[0]);
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(12.99),
        );

        $bottle::eraseRecordedEvents();

        $bottle->delete();

        $this->assertInstanceOf(BottleDeleted::class, $bottle::getRecordedEvent()[0]);
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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
            Owner::create(
                OwnerId::fromString('e4c419fc-d31a-4655-a7d5-7b193c4b52e6'),
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
                OwnerFullName::fromString('Hugues Gobet'),
            ),
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

        $this->assertInstanceOf(BottleUpdated::class, $bottle::getRecordedEvent()[0]);
        $bottle::eraseRecordedEvents();
    }
}
