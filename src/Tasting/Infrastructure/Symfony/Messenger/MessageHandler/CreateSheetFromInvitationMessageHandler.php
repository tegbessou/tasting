<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Tasting\Application\Command\CreateSheetCommand;
use App\Tasting\Application\Exception\SheetAlreadyExistException;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenInvitationIsAcceptedMessage;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;

#[AsMessageHandler]
#[WithMonologChannel('tasting')]
final readonly class CreateSheetFromInvitationMessageHandler
{
    public function __construct(
        private CommandBusInterface $bus,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(CreateSheetWhenInvitationIsAcceptedMessage $message): void
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
                'Create sheet from invitation: Sheet for this tasting and with these participant already exists',
                [
                    'tasting' => $exception->tasting,
                    'participant' => $exception->participant,
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        }
    }
}
