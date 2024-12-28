<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Projection\Projector\AddEyeToSheetProjector;
use App\Tasting\Domain\Event\EyeAdded;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class AddEyeToSheetProjection
{
    public function __construct(
        private AddEyeToSheetProjector $addEyeToSheetProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(EyeAdded $event): void
    {
        try {
            $this->addEyeToSheetProjector->project(
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
                'Add eye to sheet projection: Sheet from doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
