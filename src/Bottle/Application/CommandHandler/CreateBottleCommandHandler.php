<?php

declare(strict_types=1);

namespace App\Bottle\Application\CommandHandler;

use App\Bottle\Application\Command\CreateBottleCommand;
use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Event\CheckOwnerExistEvent;
use App\Bottle\Domain\Exception\BottleCreationCountryDoesntExistException;
use App\Bottle\Domain\Exception\BottleCreationGrapeVarietiesDoesntExistException;
use App\Bottle\Domain\Repository\BottleRepositoryInterface;
use App\Bottle\Domain\Repository\CountryRepositoryInterface;
use App\Bottle\Domain\Repository\GrapeVarietyRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleOwnerId;
use App\Bottle\Domain\ValueObject\BottlePicture;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Bottle\Domain\ValueObject\CountryName;
use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use App\Shared\Application\Command\AsCommandHandler;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateBottleCommandHandler
{
    public function __construct(
        private EventDispatcherInterface $dispatcher,
        private CountryRepositoryInterface $countryRepository,
        private GrapeVarietyRepositoryInterface $grapeVarietyRepository,
        private BottleRepositoryInterface $bottleRepository,
    ) {
    }

    public function __invoke(CreateBottleCommand $createBottleCommand): void
    {
        $this->dispatcher->dispatch(
            new CheckOwnerExistEvent($createBottleCommand->ownerId),
        );

        $this->validateThatCountryExists($createBottleCommand);
        $this->validateThatGrapeVarietiesExist($createBottleCommand);

        $bottle = Bottle::create(
            $this->bottleRepository->nextIdentity(),
            BottleName::fromString($createBottleCommand->name),
            BottleEstateName::fromString($createBottleCommand->estateName),
            BottleWineType::fromString($createBottleCommand->type),
            BottleYear::fromInt($createBottleCommand->year),
            BottleGrapeVarieties::fromArray($createBottleCommand->grapeVarieties),
            BottleRate::fromString($createBottleCommand->rate),
            BottlePicture::fromString($createBottleCommand->picture),
            BottleOwnerId::fromString($createBottleCommand->ownerId),
            $createBottleCommand->country !== null ? BottleCountry::fromString($createBottleCommand->country) : null,
            $createBottleCommand->price !== null ? BottlePrice::fromFloat($createBottleCommand->price) : null,
        );

        $this->bottleRepository->add($bottle);
    }

    private function validateThatCountryExists(CreateBottleCommand $createBottleCommand): void
    {
        if ($createBottleCommand->country === null) {
            return;
        }

        if ($this->countryRepository->exist(CountryName::fromString($createBottleCommand->country))) {
            return;
        }

        throw new BottleCreationCountryDoesntExistException($createBottleCommand->country);
    }

    private function validateThatGrapeVarietiesExist(CreateBottleCommand $createBottleCommand): void
    {
        if (count($createBottleCommand->grapeVarieties) === 0) {
            return;
        }

        $grapeVarietiesDoesntExist = [];

        foreach ($createBottleCommand->grapeVarieties as $grapeVariety) {
            if ($this->grapeVarietyRepository->exist(GrapeVarietyName::fromString($grapeVariety))) {
                continue;
            }

            $grapeVarietiesDoesntExist[] = $grapeVariety;
        }

        if (count($grapeVarietiesDoesntExist) === 0) {
            return;
        }

        throw new BottleCreationGrapeVarietiesDoesntExistException($grapeVarietiesDoesntExist);
    }
}
