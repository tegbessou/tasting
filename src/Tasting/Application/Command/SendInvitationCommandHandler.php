<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Application\Service\EmailServiceInterface;
use App\Tasting\Application\Service\NotificationServiceInterface;
use App\Tasting\Domain\Exception\BottleDoesntExistException;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\InvitationTargetDoesntExistException;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Domain\Repository\BottleReadRepositoryInterface;
use App\Tasting\Domain\Repository\InvitationReadRepositoryInterface;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

#[AsCommandHandler]
final readonly class SendInvitationCommandHandler
{
    public function __construct(
        private InvitationReadRepositoryInterface $invitationReadRepository,
        private BottleReadRepositoryInterface $bottleReadRepository,
        private ParticipantReadRepositoryInterface $participantReadRepository,
        private EmailServiceInterface $emailService,
        private NotificationServiceInterface $notificationService,
        private InvitationWriteRepositoryInterface $invitationWriteRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(SendInvitationCommand $command): void
    {
        $invitation = $this->invitationReadRepository->ofId(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $bottle = $this->bottleReadRepository->ofId(
            BottleId::fromString($command->bottleId)
        );

        if ($bottle === null) {
            throw new BottleDoesntExistException($command->bottleId);
        }

        $owner = $this->participantReadRepository->ofEmail(
            ParticipantEmail::fromString($command->ownerEmail),
        );

        if ($owner === null) {
            throw new OwnerDoesntExistException($command->ownerEmail);
        }

        $target = $this->participantReadRepository->ofEmail(
            ParticipantEmail::fromString($command->targetEmail),
        );

        if ($target === null) {
            throw new InvitationTargetDoesntExistException($command->targetEmail);
        }

        $invitation->send();

        $this->emailService->sendInvitationEmail(
            $owner,
            $target,
            $bottle->name(),
            $invitation->link(),
        );

        $this->notificationService->sendInvitationNotification(
            $owner,
            $target,
            $bottle->name(),
        );

        $this->eventDispatcher->dispatch($invitation);

        $this->invitationWriteRepository->update();
    }
}
