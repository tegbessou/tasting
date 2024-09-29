<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Exception\InvitationDoesntExistException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class AcceptInvitationCommandHandler
{
    public function __construct(
        private InvitationRepositoryInterface $invitationRepository,
        private TastingRepositoryInterface $tastingRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(AcceptInvitationCommand $command): void
    {
        $tasting = $this->tastingRepository->ofId(
            TastingId::fromString($command->tastingId),
        );

        if ($tasting === null) {
            throw new TastingDoesntExistException($command->tastingId);
        }

        $invitation = $this->invitationRepository->ofId(
            InvitationId::fromString($command->invitationId),
        );

        if ($invitation === null) {
            throw new InvitationDoesntExistException($command->invitationId);
        }

        $tasting->acceptInvitation($invitation);

        $this->dispatcher->dispatch($invitation);

        $this->invitationRepository->update();
    }
}
