<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class DeleteAllSheetsWithTastingCommandHandler
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(DeleteAllSheetsWithTastingCommand $command): void
    {
        $sheets = $this->sheetRepository->withTasting(
            SheetTastingId::fromString($command->tastingId),
        );

        if ($sheets === []) {
            return;
        }

        /** @var Sheet $sheet */
        foreach ($sheets as $sheet) {
            $sheet->delete();

            $this->sheetRepository->delete($sheet);

            $this->dispatcher->dispatch($sheet);
        }
    }
}
