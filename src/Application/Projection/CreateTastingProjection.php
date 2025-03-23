<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection;

use EmpireDesAmis\Tasting\Application\Exception\OwnerDoesntExistException;
use EmpireDesAmis\Tasting\Application\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Application\Projection\Projector\CreateTastingProjector;
use EmpireDesAmis\Tasting\Domain\Event\TastingCreated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class CreateTastingProjection
{
    public function __construct(
        private CreateTastingProjector $createTastingProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(TastingCreated $event): void
    {
        try {
            $this->createTastingProjector->project(
                $event->tastingId,
                $event->ownerId,
                $event->bottleName,
                $event->bottleWineType,
            );
        } catch (TastingDoesntExistException $exception) {
            $this->logger->error(
                'Create tasting projection: Tasting projection creation failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        } catch (OwnerDoesntExistException $exception) {
            $this->logger->error(
                'Create tasting projection: Owner doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
