<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Eye;
use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Exception\EyeAlreadyAddedException;
use App\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;

final readonly class EyeCanBeAdd
{
    public function __construct(
        private Sheet $sheet,
    ) {
    }

    public function satisfiedBy(Eye $eye, WineType $wineType): void
    {
        if ($this->sheet->eye() !== null) {
            throw new EyeAlreadyAddedException();
        }

        if (!in_array($eye->teinte()->value(), $wineType->getTeintes())) {
            throw new EyeTeinteIsNotForThisWineTypeException($eye->teinte()->value(), $wineType->value);
        }
    }
}
