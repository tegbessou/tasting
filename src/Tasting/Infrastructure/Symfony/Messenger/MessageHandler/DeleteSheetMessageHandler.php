<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Tasting\Application\Command\DeleteAllSheetsWithTastingCommand;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\TastingDeletedMessage;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[AsMessageHandler]
final readonly class DeleteSheetMessageHandler
{
    public function __construct(
        private CommandBusInterface $commandBus,
    ) {
    }

    public function __invoke(
        TastingDeletedMessage $tastingDeletedMessage,
    ): void {
        Assert::uuid($tastingDeletedMessage->tastingId);

        $this->commandBus->dispatch(
            new DeleteAllSheetsWithTastingCommand(
                $tastingDeletedMessage->tastingId,
            ),
        );
    }
}
