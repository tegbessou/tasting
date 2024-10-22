<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\Projector\UpdateBottleProjector;
use App\BottleInventory\Domain\Event\BottleUpdated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('bottle_inventory')]
final readonly class UpdateBottleProjection
{
    public function __construct(
        private UpdateBottleProjector $updateBottleProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleUpdated $event): void
    {
        try {
            $this->updateBottleProjector->project(
                $event->bottleId,
                $event->name,
                $event->estateName,
                $event->wineType,
                $event->year,
                $event->grapeVarieties,
                $event->rate,
                $event->country,
                $event->price,
            );
        } catch (BottleDoesntExistException $exception) {
            $this->logger->error(
                'Update bottle projection: Bottle projection update failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
