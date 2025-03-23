<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Exception\EyeShouldBeAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeTeinte;

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
