<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection;

use App\Tasting\Application\Exception\InvitationFromDoesntExistException;
use App\Tasting\Application\Projection\Projector\CreateInvitationProjector;
use App\Tasting\Domain\Event\TastingParticipantInvited;
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
