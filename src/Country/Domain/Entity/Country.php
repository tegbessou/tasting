<?php

declare(strict_types=1);

namespace App\Country\Domain\Entity;

use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final readonly class Country
{
    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private CountryId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private CountryName $name,
    ) {
    }

    public static function create(
        CountryId $id,
        CountryName $name,
    ): self {
        return new self(
            $id,
            $name,
        );
    }

    public function id(): CountryId
    {
        return $this->id;
    }

    public function name(): CountryName
    {
        return $this->name;
    }
}
