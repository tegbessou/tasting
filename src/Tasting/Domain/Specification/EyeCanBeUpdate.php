<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Exception\EyeShouldBeAddedException;
use App\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use App\Tasting\Domain\ValueObject\EyeTeinte;

final readonly class EyeCanBeUpdate
{
    public function __construct(
        private Sheet $sheet,
    ) {
    }

    public function satisfiedBy(EyeTeinte $teinte, WineType $wineType): void
    {
        if ($this->sheet->eye() === null) {
            throw new EyeShouldBeAddedException();
        }

        if (!in_array($teinte->value(), $wineType->getTeintes())) {
            throw new EyeTeinteIsNotForThisWineTypeException($teinte->value(), $wineType->value);
        }
    }
}
