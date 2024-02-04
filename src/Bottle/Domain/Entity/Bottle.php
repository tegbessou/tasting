<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Entity;

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
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final readonly class Bottle
{
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
        private BottlePicture $picture,
        #[ORM\Embedded(columnPrefix: false)]
        private BottleOwnerId $ownerId,
        #[ORM\Embedded(columnPrefix: false)]
        private ?BottleCountry $country = null,
        #[ORM\Embedded(columnPrefix: false)]
        private ?BottlePrice $price = null,
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
        BottlePicture $picture,
        BottleOwnerId $ownerId,
        BottleCountry $country = null,
        BottlePrice $price = null,
    ): self {
        return new self(
            $id,
            $name,
            $estateName,
            $wineType,
            $year,
            $grapeVarieties,
            $rate,
            $picture,
            $ownerId,
            $country,
            $price,
        );
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

    public function picture(): BottlePicture
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
}
