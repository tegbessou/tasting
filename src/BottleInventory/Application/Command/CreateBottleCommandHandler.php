<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Exception\BottleOwnerDoesntExistException;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\Repository\OwnerRepositoryInterface;
use App\BottleInventory\Domain\Service\BottleValidator;
use App\BottleInventory\Domain\ValueObject\BottleCountry;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleGrapeVarieties;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottlePrice;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateBottleCommandHandler
{
    public function __construct(
        private DomainEventDispatcherInterface $dispatcher,
        private BottleValidator $validator,
        private BottleRepositoryInterface $bottleRepository,
        private OwnerRepositoryInterface $ownerRepository,
    ) {
    }

    public function __invoke(CreateBottleCommand $createBottleCommand): BottleId
    {
        $this->validator->validate(
            $createBottleCommand->country,
            $createBottleCommand->grapeVarieties,
            $createBottleCommand->ownerId,
        );

        $owner = $this->ownerRepository->ofId(
            OwnerId::fromString($createBottleCommand->ownerId)
        );

        if ($owner === null) {
            throw new BottleOwnerDoesntExistException($createBottleCommand->ownerId);
        }

        $bottle = Bottle::create(
            $this->bottleRepository->nextIdentity(),
            BottleName::fromString($createBottleCommand->name),
            BottleEstateName::fromString($createBottleCommand->estateName),
            BottleWineType::fromString($createBottleCommand->type),
            BottleYear::fromInt($createBottleCommand->year),
            BottleGrapeVarieties::fromArray($createBottleCommand->grapeVarieties),
            BottleRate::fromString($createBottleCommand->rate),
            $owner,
            $createBottleCommand->country !== null ? BottleCountry::fromString($createBottleCommand->country) : null,
            $createBottleCommand->price !== null ? BottlePrice::fromFloat($createBottleCommand->price) : null,
        );

        $this->dispatcher->dispatch($bottle);

        $this->bottleRepository->add($bottle);

        return $bottle->id();
    }
}
