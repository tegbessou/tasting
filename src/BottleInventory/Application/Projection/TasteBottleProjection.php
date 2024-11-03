<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\Projector\TasteBottleProjector;
use App\BottleInventory\Domain\Event\BottleTasted;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('bottle_inventory')]
final readonly class TasteBottleProjection
{
    public function __construct(
        private TasteBottleProjector $tasteBottleProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(BottleTasted $event): void
    {
        try {
            $this->tasteBottleProjector->project(
                $event->bottleId,
                $event->tastedAt,
            );
        } catch (BottleDoesntExistException $exception) {
            $this->logger->error(
                'Taste bottle projection: Bottle projection update failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
