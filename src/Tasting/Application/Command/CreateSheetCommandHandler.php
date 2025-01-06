<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Application\Exception\SheetAlreadyExistException;
use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Factory\IdFactory;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateSheetCommandHandler
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private DomainEventDispatcherInterface $dispatcher,
        private IdFactory $idFactory,
    ) {
    }

    public function __invoke(CreateSheetCommand $command): void
    {
        if ($this->sheetRepository->withTastingAndParticipant(
            SheetTastingId::fromString($command->tastingId),
            SheetParticipant::fromString($command->participant)) !== []
        ) {
            throw new SheetAlreadyExistException($command->tastingId, $command->participant);
        }

        $sheet = Sheet::create(
            SheetId::fromString(
                $this->idFactory->create(),
            ),
            SheetTastingId::fromString($command->tastingId),
            SheetParticipant::fromString($command->participant),
        );

        $this->sheetRepository->add($sheet);

        $this->dispatcher->dispatch($sheet);
    }
}
