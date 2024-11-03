<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\Projector\DeleteBottleProjector;
use App\BottleInventory\Domain\Event\BottleDeleted;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('bottle_inventory')]
final readonly class DeleteBottleProjection
{
    public function __construct(
        private DeleteBottleProjector $projector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleDeleted $event): void
    {
        try {
            $this->projector->project($event->bottleId);
        } catch (BottleDoesntExistException $exception) {
            $this->logger->error(
                'Delete bottle projection: Delete bottle projection failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
