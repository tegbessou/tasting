<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateTastingCommandHandler
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $domainEventDispatcher,
    ) {
    }

    public function __invoke(CreateTastingCommand $command): void
    {
        $tasting = Tasting::create(
            $this->tastingRepository->nextIdentity(),
            BottleName::fromString($command->bottleName),
            TastingOwnerId::fromString($command->ownerEmail),
        );

        $this->tastingRepository->add(
            $tasting,
        );

        $this->domainEventDispatcher->dispatch($tasting);
    }
}
