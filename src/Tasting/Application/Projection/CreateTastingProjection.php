<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\OwnerDoesntExistException;
use App\Tasting\Application\Exception\TastingDoesntExistException;
use App\Tasting\Application\Projection\Projector\CreateTastingProjector;
use App\Tasting\Domain\Event\TastingCreated;
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
