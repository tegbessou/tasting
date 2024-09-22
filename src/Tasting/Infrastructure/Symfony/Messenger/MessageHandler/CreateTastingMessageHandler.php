<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\CreateTastingCommand;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;

#[AsMessageHandler]
#[WithMonologChannel('tasting')]
final readonly class CreateTastingMessageHandler
{
    public function __construct(
        private CommandBusInterface $bus,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleTastedMessage $bottleTastedMessage): void
    {
        Assert::string($bottleTastedMessage->bottleName);
        Assert::maxLength($bottleTastedMessage->bottleName, 255);
        Assert::email($bottleTastedMessage->ownerEmail);
        Assert::maxLength($bottleTastedMessage->ownerEmail, 255);

        try {
            $this->bus->dispatch(new CreateTastingCommand(
                $bottleTastedMessage->bottleName,
                $bottleTastedMessage->ownerEmail,
            ));
        } catch (OwnerDoesntExistException $exception) {
            $this->logger->error(
                'Create tasting: Owner doesn\'t exist',
                [
                    'email' => $exception->ownerEmail,
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        } catch (\InvalidArgumentException $exception) {
            $this->logger->error(
                'Create tasting: Invalid argument',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        }
    }
}
