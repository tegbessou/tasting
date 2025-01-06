<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Factory\IdFactory;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateTastingCommandHandler
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $domainEventDispatcher,
        private IdFactory $idFactory,
    ) {
    }

    public function __invoke(CreateTastingCommand $command): void
    {
        $tasting = Tasting::create(
            TastingId::fromString(
                $this->idFactory->create(),
            ),
            Bottle::create(
                $command->bottleId,
                $command->bottleName,
                $command->bottleWineType,
            ),
            TastingOwnerId::fromString($command->ownerEmail),
        );

        $this->tastingRepository->add(
            $tasting,
        );

        $this->domainEventDispatcher->dispatch($tasting);
    }
}
