<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Projection\Projector\UpdateNoseToSheetProjector;
use App\Tasting\Domain\Event\NoseUpdated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class UpdateNoseToSheetProjection
{
    public function __construct(
        private UpdateNoseToSheetProjector $updateNoseToSheetProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(NoseUpdated $event): void
    {
        try {
            $this->updateNoseToSheetProjector->project(
                $event->sheetId,
                $event->impression,
                $event->intensite,
                $event->arome,
                $event->observation,
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Update nose to sheet projection: Sheet doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
