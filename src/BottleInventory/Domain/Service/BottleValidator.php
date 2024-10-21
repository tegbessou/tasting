<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Service;

use App\BottleInventory\Domain\Adapter\CountryAdapterInterface;
use App\BottleInventory\Domain\Exception\BottleCountryDoesntExistException;
use App\BottleInventory\Domain\Exception\BottleGrapeVarietiesDoesntExistException;
use App\BottleInventory\Domain\Repository\GrapeVarietyRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\CountryName;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;

final readonly class BottleValidator
{
    public function __construct(
        private CountryAdapterInterface $countryReadRepository,
        private GrapeVarietyRepositoryInterface $grapeVarietyReadRepository,
    ) {
    }

    public function validate(
        ?string $country,
        array $grapeVarieties = [],
    ): void {
        $this->validateThatCountryExists($country);
        $this->validateThatGrapeVarietiesExist($grapeVarieties);
    }

    private function validateThatCountryExists(?string $country): void
    {
        if ($country === null) {
            return;
        }

        if ($this->countryReadRepository->exist(CountryName::fromString($country))) {
            return;
        }

        throw new BottleCountryDoesntExistException($country);
    }

    private function validateThatGrapeVarietiesExist(array $grapeVarieties): void
    {
        if (count($grapeVarieties) === 0) {
            return;
        }

        $grapeVarietiesDoesntExist = [];

        foreach ($grapeVarieties as $grapeVariety) {
            if ($this->grapeVarietyReadRepository->exist(GrapeVarietyName::fromString($grapeVariety))) {
                continue;
            }

            $grapeVarietiesDoesntExist[] = $grapeVariety;
        }

        if (count($grapeVarietiesDoesntExist) === 0) {
            return;
        }

        throw new BottleGrapeVarietiesDoesntExistException($grapeVarietiesDoesntExist);
    }
}
