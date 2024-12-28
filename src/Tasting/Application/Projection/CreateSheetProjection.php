<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Exception\SheetParticipantDoesntExistException;
use App\Tasting\Application\Projection\Projector\CreateSheetProjector;
use App\Tasting\Domain\Event\SheetCreated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class CreateSheetProjection
{
    public function __construct(
        private CreateSheetProjector $createTastingProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(SheetCreated $event): void
    {
        try {
            $this->createTastingProjector->project(
                $event->sheetId,
                $event->tastingId,
                $event->participant,
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Create sheet projection: Sheet doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        } catch (SheetParticipantDoesntExistException $exception) {
            $this->logger->error(
                'Create sheet projection: Participant doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
