<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Mouth;
use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Exception\MouthAlreadyAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthSucreShouldBeIfWineIsSweetException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthSucreShouldntBeIfWineIsNotSweetException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthTaninShouldBeIfWineTypeIsRedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthTaninShouldntBeIfWineTypeIsNotRedException;

final readonly class MouthCanBeAdd
{
    public function __construct(
        private Sheet $sheet,
    ) {
    }

    public function satisfiedBy(Mouth $mouth, WineType $wineType): void
    {
        if ($this->sheet->mouth() !== null) {
            throw new MouthAlreadyAddedException();
        }

        if ($wineType !== WineType::RedWine && $mouth->tanin() !== null) {
            throw new MouthTaninShouldntBeIfWineTypeIsNotRedException();
        }

        if ($wineType === WineType::RedWine && $mouth->tanin() === null) {
            throw new MouthTaninShouldBeIfWineTypeIsRedException();
        }

        if (!$wineType->isSweetWine() && $mouth->sucre() !== null) {
            throw new MouthSucreShouldntBeIfWineIsNotSweetException();
        }

        if ($wineType->isSweetWine() && $mouth->sucre() === null) {
            throw new MouthSucreShouldBeIfWineIsSweetException();
        }
    }
}
