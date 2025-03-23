<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection;

use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Application\Exception\SheetParticipantDoesntExistException;
use EmpireDesAmis\Tasting\Application\Projection\Projector\CreateSheetProjector;
use EmpireDesAmis\Tasting\Domain\Event\SheetCreated;
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
