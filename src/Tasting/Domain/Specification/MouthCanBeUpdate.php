<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Exception\MouthShouldBeAddedException;
use App\Tasting\Domain\Exception\MouthSucreShouldBeIfWineIsSweetException;
use App\Tasting\Domain\Exception\MouthSucreShouldntBeIfWineIsNotSweetException;
use App\Tasting\Domain\Exception\MouthTaninShouldBeIfWineTypeIsRedException;
use App\Tasting\Domain\Exception\MouthTaninShouldntBeIfWineTypeIsNotRedException;
use App\Tasting\Domain\ValueObject\MouthSucre;
use App\Tasting\Domain\ValueObject\MouthTanin;

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
