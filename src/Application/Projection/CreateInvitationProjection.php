<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection;

use EmpireDesAmis\Tasting\Application\Exception\InvitationFromDoesntExistException;
use EmpireDesAmis\Tasting\Application\Projection\Projector\CreateInvitationProjector;
use EmpireDesAmis\Tasting\Domain\Event\TastingParticipantInvited;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('tasting')]
final readonly class CreateInvitationProjection
{
    public function __construct(
        private CreateInvitationProjector $createInvitationProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(TastingParticipantInvited $event): void
    {
        try {
            $this->createInvitationProjector->project(
                $event->invitationId,
                $event->tastingId,
                $event->bottleName,
                $event->fromId,
                $event->targetId,
                $event->link,
                $event->createdAt,
            );
        } catch (InvitationFromDoesntExistException $exception) {
            $this->logger->error(
                'Create invitation projection: Invitation from doesn\'t exist',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
