<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Projection\Projector\UpdateEyeToSheetProjector;
use App\Tasting\Domain\Event\EyeUpdated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class UpdateEyeToSheetProjection
{
    public function __construct(
        private UpdateEyeToSheetProjector $updateEyeToSheetProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(EyeUpdated $event): void
    {
        try {
            $this->updateEyeToSheetProjector->project(
                $event->sheetId,
                $event->limpidite,
                $event->brillance,
                $event->intensiteCouleur,
                $event->teinte,
                $event->larme,
                $event->observation,
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Update eye to sheet projection: Sheet doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
