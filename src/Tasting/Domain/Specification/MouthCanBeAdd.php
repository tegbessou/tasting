<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Mouth;
use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Exception\MouthAlreadyAddedException;
use App\Tasting\Domain\Exception\MouthSucreShouldBeIfWineIsSweetException;
use App\Tasting\Domain\Exception\MouthSucreShouldntBeIfWineIsNotSweetException;
use App\Tasting\Domain\Exception\MouthTaninShouldBeIfWineTypeIsRedException;
use App\Tasting\Domain\Exception\MouthTaninShouldntBeIfWineTypeIsNotRedException;

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
