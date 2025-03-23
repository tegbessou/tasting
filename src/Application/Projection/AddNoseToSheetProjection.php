<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection;

use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Application\Projection\Projector\AddNoseToSheetProjector;
use EmpireDesAmis\Tasting\Domain\Event\NoseAdded;
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
