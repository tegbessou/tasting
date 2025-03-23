<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection;

use EmpireDesAmis\Tasting\Application\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Application\Projection\Projector\DeleteTastingProjector;
use EmpireDesAmis\Tasting\Domain\Event\TastingDeleted;
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
