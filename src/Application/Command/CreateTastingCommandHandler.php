<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\Factory\IdFactory;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
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
