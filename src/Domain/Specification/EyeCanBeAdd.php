<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Eye;
use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Exception\EyeAlreadyAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;

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
