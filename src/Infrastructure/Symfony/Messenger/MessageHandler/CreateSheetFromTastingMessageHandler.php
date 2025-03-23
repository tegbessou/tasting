<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use EmpireDesAmis\Tasting\Application\Command\CreateSheetCommand;
use EmpireDesAmis\Tasting\Application\Exception\SheetAlreadyExistException;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenTastingIsCreatedMessage;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;

#[AsMessageHandler]
#[WithMonologChannel('tasting')]
final readonly class CreateSheetFromTastingMessageHandler
{
    public function __construct(
        private CommandBusInterface $bus,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(CreateSheetWhenTastingIsCreatedMessage $message): void
    {
        try {
            $this->bus->dispatch(
                new CreateSheetCommand(
                    $message->tastingId,
                    $message->participant,
                ),
            );
        } catch (SheetAlreadyExistException $exception) {
            $this->logger->error(
                'Create sheet from tasting: Sheet for this tasting and with these participant already exists',
                [
                    'tasting' => $exception->tasting,
                    'participant' => $exception->participant,
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        }
    }
}
