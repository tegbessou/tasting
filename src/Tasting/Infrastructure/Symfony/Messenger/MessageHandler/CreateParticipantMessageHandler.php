<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Tasting\Application\Command\CreateParticipantCommand;
use App\Tasting\Domain\Exception\ParticipantDoesntExistException;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\Exception\UnrecoverableMessageHandlingException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[AsMessageHandler]
#[WithMonologChannel('tasting')]
final readonly class CreateParticipantMessageHandler
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(UserCreatedMessage $createdMessage): void
    {
        Assert::email($createdMessage->email);
        Assert::maxLength($createdMessage->email, 255);
        Assert::string($createdMessage->fullName);
        Assert::maxLength($createdMessage->fullName, 255);

        try {
            $this->commandBus->dispatch(
                new CreateParticipantCommand(
                    $createdMessage->email,
                    $createdMessage->fullName,
                ),
            );
        } catch (ParticipantDoesntExistException $exception) {
            $this->logger->error(
                'Create participant: Participant doesn\'t exist',
                [
                    'email' => $exception->email,
                ],
            );

            throw new UnrecoverableMessageHandlingException();
        }
    }
}
