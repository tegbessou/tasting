<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection;

use EmpireDesAmis\Tasting\Application\Exception\InvitationDoesntExistException;
use EmpireDesAmis\Tasting\Application\Projection\Projector\DeleteInvitationProjector;
use EmpireDesAmis\Tasting\Domain\Event\InvitationDeleted;
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

    public function __invoke(InvitationDeleted $event): void
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
