<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\InvitationDoesntExistException;
use App\Tasting\Application\Projection\Projector\DeleteInvitationProjector;
use App\Tasting\Domain\Event\InvitationRemoved;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class DeleteInvitationProjection
{
    public function __construct(
        private DeleteInvitationProjector $projector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(InvitationRemoved $event): void
    {
        try {
            $this->projector->project(
                $event->invitationId,
            );
        } catch (InvitationDoesntExistException $exception) {
            $this->logger->error(
                'Delete invitation projection: Delete invitation projection failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
