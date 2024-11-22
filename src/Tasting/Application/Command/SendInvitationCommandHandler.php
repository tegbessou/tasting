<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Application\Service\MailerInterface;
use App\Tasting\Application\Service\NotificationInterface;
use App\Tasting\Domain\Adapter\UserAdapterInterface;
use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\OwnerDoesntExistException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class SendInvitationCommandHandler
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private MailerInterface $emailService,
        private NotificationInterface $notificationService,
        private DomainEventDispatcherInterface $eventDispatcher,
        private UserAdapterInterface $userAdapter,
    ) {
    }

    public function __invoke(SendInvitationCommand $command): void
    {
        $tasting = $this->tastingRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        $invitation = $tasting->invitations()->find(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $owner = $this->userAdapter->ofEmail(
            ParticipantId::fromString($tasting->ownerId()->value()),
        );

        if ($owner === null) {
            throw new OwnerDoesntExistException($tasting->ownerId()->value());
        }

        $tasting->sendInvitation($invitation);

        $this->emailService->sendInvitationEmail(
            $owner->email()->value(),
            $owner->fullName()->value(),
            $invitation->target()->value(),
            $tasting->bottleName()->value(),
            $invitation->link()->value(),
        );

        $this->notificationService->sendInvitationNotification(
            $owner->fullName()->value(),
            $invitation->target()->value(),
            $tasting->bottleName()->value(),
        );

        $this->tastingRepository->update($tasting);

        $this->eventDispatcher->dispatch($tasting);
    }
}
