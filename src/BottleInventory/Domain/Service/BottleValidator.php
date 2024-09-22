<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Service;

use App\BottleInventory\Domain\Adapter\CountryAdapterInterface;
use App\BottleInventory\Domain\Exception\BottleCountryDoesntExistException;
use App\BottleInventory\Domain\Exception\BottleGrapeVarietiesDoesntExistException;
use App\BottleInventory\Domain\Exception\BottleOwnerDoesntExistException;
use App\BottleInventory\Domain\Repository\GrapeVarietyRepositoryInterface;
use App\BottleInventory\Domain\Repository\OwnerRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\CountryName;
use App\BottleInventory\Domain\ValueObject\GrapeVarietyName;
use App\BottleInventory\Domain\ValueObject\OwnerId;

final readonly class BottleValidator
{
    public function __construct(
        private CountryAdapterInterface $countryReadRepository,
        private GrapeVarietyRepositoryInterface $grapeVarietyReadRepository,
        private OwnerRepositoryInterface $ownerRepository,
    ) {
    }

    public function validate(
        ?string $country,
        array $grapeVarieties = [],
        ?string $ownerId = null,
    ): void {
        $this->validateThatCountryExists($country);
        $this->validateThatGrapeVarietiesExist($grapeVarieties);
        $this->validateThatOwnerExist($ownerId);
    }

    private function validateThatOwnerExist(?string $ownerId): void
    {
        if ($ownerId === null) {
            return;
        }

        if ($this->ownerRepository->exist(OwnerId::fromString($ownerId))) {
            return;
        }

        throw new BottleOwnerDoesntExistException($ownerId);
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
