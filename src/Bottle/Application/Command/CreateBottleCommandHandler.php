<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Repository\BottleWriteRepositoryInterface;
use App\Bottle\Domain\Service\BottleValidator;
use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleOwnerId;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateBottleCommandHandler
{
    public function __construct(
        private DomainEventDispatcherInterface $dispatcher,
        private BottleValidator $validator,
        private BottleWriteRepositoryInterface $bottleWriteRepository,
    ) {
    }

    public function __invoke(CreateBottleCommand $createBottleCommand): void
    {
        $this->validator->validate(
            $createBottleCommand->country,
            $createBottleCommand->grapeVarieties,
        );

        $bottle = Bottle::create(
            $this->bottleWriteRepository->nextIdentity(),
            BottleName::fromString($createBottleCommand->name),
            BottleEstateName::fromString($createBottleCommand->estateName),
            BottleWineType::fromString($createBottleCommand->type),
            BottleYear::fromInt($createBottleCommand->year),
            BottleGrapeVarieties::fromArray($createBottleCommand->grapeVarieties),
            BottleRate::fromString($createBottleCommand->rate),
            BottleOwnerId::fromString($createBottleCommand->ownerId),
            $createBottleCommand->country !== null ? BottleCountry::fromString($createBottleCommand->country) : null,
            $createBottleCommand->price !== null ? BottlePrice::fromFloat($createBottleCommand->price) : null,
        );

        $this->dispatcher->dispatch($bottle);

        $this->bottleWriteRepository->add($bottle);
    }
}
