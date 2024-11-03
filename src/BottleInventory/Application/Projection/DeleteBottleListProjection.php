<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\Projector\DeleteBottleListProjector;
use App\BottleInventory\Domain\Event\BottleDeleted;
use Psr\Log\LoggerInterface;

final readonly class DeleteBottleListProjection
{
    public function __construct(
        private DeleteBottleListProjector $projector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleDeleted $event): void
    {
        try {
            $this->projector->project($event->bottleId);
        } catch (BottleDoesntExistException $exception) {
            $this->logger->error(
                'Delete bottle list projection: Delete bottle list projection failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
