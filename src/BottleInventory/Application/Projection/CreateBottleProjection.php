<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Exception\OwnerDoesntExistException;
use App\BottleInventory\Application\Projection\Projector\CreateBottleProjector;
use App\BottleInventory\Domain\Event\BottleCreated;
use Psr\Log\LoggerInterface;

final readonly class CreateBottleProjection
{
    public function __construct(
        private CreateBottleProjector $createBottleProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleCreated $event): void
    {
        try {
            $this->createBottleProjector->project(
                $event->bottleId,
                $event->name,
                $event->estateName,
                $event->wineType,
                $event->year,
                $event->rate,
                $event->grapeVarieties,
                $event->savedAt,
                $event->ownerId,
                $event->country,
                $event->price,
            );
        } catch (BottleDoesntExistException $exception) {
            $this->logger->error(
                'Create bottle projection: Bottle projection creation failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        } catch (OwnerDoesntExistException $exception) {
            $this->logger->error(
                'Create bottle projection: Owner doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
