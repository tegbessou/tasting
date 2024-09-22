<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Symfony\Messenger;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Application\Command\CommandInterface;
use App\Shared\Application\Service\TransactionInterface;
use Symfony\Component\Messenger\Exception\HandlerFailedException;
use Symfony\Component\Messenger\HandleTrait;
use Symfony\Component\Messenger\MessageBusInterface;

final class MessengerCommandBus implements CommandBusInterface
{
    use HandleTrait;

    public function __construct(
        MessageBusInterface $commandBus,
        private TransactionInterface $transaction,
    ) {
        $this->messageBus = $commandBus;
    }

    /**
     * @template T
     *
     * @param CommandInterface<T> $command
     *
     * @return T
     */
    #[\Override]
    public function dispatch(CommandInterface $command): mixed
    {
        try {
            $this->transaction->begin();

            /* @var T */
            $result = $this->handle($command);

            $this->transaction->commit();

            return $result;
        } catch (HandlerFailedException $e) {
            $this->transaction->rollback();

            if ($exception = current($e->getWrappedExceptions())) {
                throw $exception;
            }

            throw $e;
        }
    }
}
