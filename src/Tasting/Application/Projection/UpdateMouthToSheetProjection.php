<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Projection\Projector\UpdateMouthToSheetProjector;
use App\Tasting\Domain\Event\MouthUpdated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class UpdateMouthToSheetProjection
{
    public function __construct(
        private UpdateMouthToSheetProjector $addMouthToSheetProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(MouthUpdated $event): void
    {
        try {
            $this->addMouthToSheetProjector->project(
                $event->sheetId,
                $event->alcool,
                $event->acide,
                $event->matiere,
                $event->finale,
                $event->observation,
                $event->tanin,
                $event->sucre,
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Update mouth to sheet projection: Sheet doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
