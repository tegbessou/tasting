<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Application\Service\MailerInterface;
use App\Tasting\Application\Service\NotificationInterface;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\InvitationTargetDoesntExistException;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class SendInvitationCommandHandler
{
    public function __construct(
        private InvitationRepositoryInterface $invitationRepository,
        private ParticipantRepositoryInterface $participantRepository,
        private MailerInterface $emailService,
        private NotificationInterface $notificationService,
        private DomainEventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(SendInvitationCommand $command): void
    {
        $invitation = $this->invitationRepository->ofId(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $owner = $this->participantRepository->ofEmail(
            ParticipantEmail::fromString($command->ownerEmail),
        );

        if ($owner === null) {
            throw new OwnerDoesntExistException($command->ownerEmail);
        }

        $target = $this->participantRepository->ofEmail(
            ParticipantEmail::fromString($command->targetEmail),
        );

        if ($target === null) {
            throw new InvitationTargetDoesntExistException($command->targetEmail);
        }

        $invitation->send();

        $this->emailService->sendInvitationEmail(
            $owner,
            $target,
            BottleName::fromString($command->bottleName),
            $invitation->link(),
        );

        $this->notificationService->sendInvitationNotification(
            $owner,
            $target,
            BottleName::fromString($command->bottleName),
        );

        $this->eventDispatcher->dispatch($invitation);

        $this->invitationRepository->update();
    }
}
