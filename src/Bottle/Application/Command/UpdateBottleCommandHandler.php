<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Bottle\Domain\Exception\UpdateBottleDoesntExistException;
use App\Bottle\Domain\Repository\BottleWriteRepositoryInterface;
use App\Bottle\Domain\Service\BottleValidator;
use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Application\EventDispatcher\DomainEventDispatcher;

#[AsCommandHandler]
final readonly class UpdateBottleCommandHandler
{
    public function __construct(
        private BottleWriteRepositoryInterface $bottleWriteRepository,
        private DomainEventDispatcher $eventDispatcher,
        private BottleValidator $bottleValidator,
    ) {
    }

    public function __invoke(
        UpdateBottleCommand $command,
    ): void {
        $this->bottleValidator->validate(
            $command->country,
            $command->grapeVarieties,
        );

        $bottle = $this->bottleWriteRepository->ofId(
            BottleId::fromString($command->bottleId),
        );

        if ($bottle === null) {
            throw new UpdateBottleDoesntExistException();
        }

        $bottle->update(
            BottleName::fromString($command->name),
            BottleEstateName::fromString($command->estateName),
            BottleWineType::fromString($command->type),
            BottleYear::fromInt($command->year),
            BottleGrapeVarieties::fromArray($command->grapeVarieties),
            BottleRate::fromString($command->rate),
            $command->country !== null ? BottleCountry::fromString($command->country) : null,
            $command->price !== null ? BottlePrice::fromFloat($command->price) : null
        );

        $this->eventDispatcher->dispatch($bottle);

        $this->bottleWriteRepository->update($bottle);
    }
}
