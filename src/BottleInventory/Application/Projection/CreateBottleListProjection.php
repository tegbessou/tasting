<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\Projector\CreateBottleListProjector;
use App\BottleInventory\Domain\Event\BottleCreated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('bottle_inventory')]
final readonly class CreateBottleListProjection
{
    public function __construct(
        private CreateBottleListProjector $createBottleListProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleCreated $event): void
    {
        try {
            $this->createBottleListProjector->project(
                $event->bottleId,
                $event->name,
                $event->estateName,
                $event->wineType,
                $event->year,
                $event->rate,
                $event->savedAt,
                $event->ownerId,
            );
        } catch (BottleDoesntExistException $exception) {
            $this->logger->error(
                'Create bottle list projection: Bottle list projection creation failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
