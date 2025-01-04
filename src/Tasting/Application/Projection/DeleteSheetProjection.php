<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\TastingDoesntExistException;
use App\Tasting\Application\Projection\Projector\DeleteSheetProjector;
use App\Tasting\Domain\Event\SheetDeleted;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class DeleteSheetProjection
{
    public function __construct(
        private DeleteSheetProjector $projector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(SheetDeleted $event): void
    {
        try {
            $this->projector->project(
                $event->sheetId,
            );
        } catch (TastingDoesntExistException $exception) {
            $this->logger->error(
                'Delete sheet projection: Delete sheet projection failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
