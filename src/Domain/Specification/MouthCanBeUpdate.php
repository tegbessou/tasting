<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Exception\MouthShouldBeAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthSucreShouldBeIfWineIsSweetException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthSucreShouldntBeIfWineIsNotSweetException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthTaninShouldBeIfWineTypeIsRedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthTaninShouldntBeIfWineTypeIsNotRedException;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthSucre;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthTanin;

final readonly class MouthCanBeUpdate
{
    public function __construct(
        private Sheet $sheet,
    ) {
    }

    public function satisfiedBy(
        WineType $wineType,
        ?MouthTanin $tanin = null,
        ?MouthSucre $sucre = null,
    ): void {
        if ($this->sheet->mouth() === null) {
            throw new MouthShouldBeAddedException();
        }

        if ($wineType !== WineType::RedWine && $tanin !== null) {
            throw new MouthTaninShouldntBeIfWineTypeIsNotRedException();
        }

        if ($wineType === WineType::RedWine && $tanin === null) {
            throw new MouthTaninShouldBeIfWineTypeIsRedException();
        }

        if (!$wineType->isSweetWine() && $sucre !== null) {
            throw new MouthSucreShouldntBeIfWineIsNotSweetException();
        }

        if ($wineType->isSweetWine() && $sucre === null) {
            throw new MouthSucreShouldBeIfWineIsSweetException();
        }
    }
}
