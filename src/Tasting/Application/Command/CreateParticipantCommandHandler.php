<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Exception\ParticipantDoesntExistException;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\Repository\ParticipantWriteRepositoryInterface;
use App\Tasting\Domain\Service\AuthorizationService;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;

#[AsCommandHandler]
final readonly class CreateParticipantCommandHandler
{
    public function __construct(
        private ParticipantReadRepositoryInterface $participantReadRepository,
        private ParticipantWriteRepositoryInterface $participantWriteRepository,
        private DomainEventDispatcherInterface $dispatcher,
        private AuthorizationService $authorizationService,
    ) {
    }

    public function __invoke(CreateParticipantCommand $command): void
    {
        if (!$this->authorizationService->isExistUser(new ParticipantEmail($command->email))) {
            throw new ParticipantDoesntExistException($command->email);
        }

        if ($this->participantReadRepository->ofEmail(new ParticipantEmail($command->email)) !== null) {
            return;
        }

        $participant = Participant::create(
            $this->participantWriteRepository->nextIdentity(),
            new ParticipantEmail($command->email),
            new ParticipantFullName($command->fullName),
        );

        $this->dispatcher->dispatch($participant);

        $this->participantWriteRepository->add($participant);
    }
}
