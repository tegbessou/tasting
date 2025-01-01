<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Projection\Projector\AddNoseToSheetProjector;
use App\Tasting\Domain\Event\NoseAdded;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class AddNoseToSheetProjection
{
    public function __construct(
        private AddNoseToSheetProjector $addEyeToSheetProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(NoseAdded $event): void
    {
        try {
            $this->addEyeToSheetProjector->project(
                $event->sheetId,
                $event->impression,
                $event->intensite,
                $event->arome,
                $event->observation,
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Add nose to sheet projection: Sheet doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
