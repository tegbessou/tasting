<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Entity;

use App\Bottle\Domain\Event\BottleCreatedEvent;
use App\Bottle\Domain\Event\BottlePictureAddedEvent;
use App\Bottle\Domain\Event\BottleTastedEvent;
use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleOwnerId;
use App\Bottle\Domain\ValueObject\BottlePicture;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleSavedAt;
use App\Bottle\Domain\ValueObject\BottleTastedAt;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final class Bottle implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    #[ORM\Embedded(columnPrefix: false)]
    private ?BottlePicture $picture = null;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private BottleId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleName $name,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleEstateName $estateName,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleWineType $wineType,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleYear $year,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleGrapeVarieties $grapeVarieties,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleRate $rate,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleOwnerId $ownerId,
        #[ORM\Embedded(columnPrefix: false)]
        private ?BottleCountry $country = null,
        #[ORM\Embedded(columnPrefix: false)]
        private ?BottlePrice $price = null,
        #[ORM\Embedded(columnPrefix: false)]
        private ?BottleSavedAt $savedAt = null,
        #[ORM\Embedded(columnPrefix: false)]
        private ?BottleTastedAt $tastedAt = null,
    ) {
    }

    public static function create(
        BottleId $id,
        BottleName $name,
        BottleEstateName $estateName,
        BottleWineType $wineType,
        BottleYear $year,
        BottleGrapeVarieties $grapeVarieties,
        BottleRate $rate,
        BottleOwnerId $ownerId,
        ?BottleCountry $country = null,
        ?BottlePrice $price = null,
    ): self {
        $bottle = new self(
            $id,
            $name,
            $estateName,
            $wineType,
            $year,
            $grapeVarieties,
            $rate,
            $ownerId,
            $country,
            $price,
            BottleSavedAt::create(),
        );

        self::recordEvent(
            new BottleCreatedEvent(
                $bottle->id->value(),
                $bottle->ownerId->id()
            )
        );

        return $bottle;
    }

    public function addPicture(BottlePicture $picture): Bottle
    {
        $this->picture = $picture;

        self::recordEvent(
            new BottlePictureAddedEvent(
                $this->id->value(),
                $this->ownerId->id(),
            )
        );

        return $this;
    }

    public function taste(): Bottle
    {
        $this->tastedAt = BottleTastedAt::create(
            new \DateTimeImmutable(),
        );

        self::recordEvent(
            new BottleTastedEvent(
                $this->id->value(),
            )
        );

        return $this;
    }

    public function id(): BottleId
    {
        return $this->id;
    }

    public function name(): BottleName
    {
        return $this->name;
    }

    public function estateName(): BottleEstateName
    {
        return $this->estateName;
    }

    public function wineType(): BottleWineType
    {
        return $this->wineType;
    }

    public function year(): BottleYear
    {
        return $this->year;
    }

    public function grapeVarieties(): BottleGrapeVarieties
    {
        return $this->grapeVarieties;
    }

    public function rate(): BottleRate
    {
        return $this->rate;
    }

    public function picture(): ?BottlePicture
    {
        return $this->picture;
    }

    public function ownerId(): BottleOwnerId
    {
        return $this->ownerId;
    }

    public function country(): ?BottleCountry
    {
        return $this->country;
    }

    public function price(): ?BottlePrice
    {
        return $this->price;
    }

    public function savedAt(): ?BottleSavedAt
    {
        return $this->savedAt;
    }

    public function tastedAt(): ?BottleTastedAt
    {
        return $this->tastedAt;
    }
}
