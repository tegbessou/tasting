<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\TastingDoesntExistException;
use App\Tasting\Application\Projection\Projector\DeleteTastingProjector;
use App\Tasting\Domain\Event\TastingDeleted;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class DeleteTastingProjection
{
    public function __construct(
        private DeleteTastingProjector $projector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(TastingDeleted $event): void
    {
        try {
            $this->projector->project(
                $event->tastingId,
            );
        } catch (TastingDoesntExistException $exception) {
            $this->logger->error(
                'Delete tasting projection: Delete tasting projection failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
