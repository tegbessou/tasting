<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Exception\ParticipantDoesntExistException;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\Service\Authorization;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateParticipantCommandHandler
{
    public function __construct(
        private ParticipantRepositoryInterface $participantRepository,
        private DomainEventDispatcherInterface $dispatcher,
        private Authorization $authorizationService,
    ) {
    }

    public function __invoke(CreateParticipantCommand $command): void
    {
        if (!$this->authorizationService->isExistUser(new ParticipantEmail($command->email))) {
            throw new ParticipantDoesntExistException($command->email);
        }

        if ($this->participantRepository->ofEmail(new ParticipantEmail($command->email)) !== null) {
            return;
        }

        $participant = Participant::create(
            $this->participantRepository->nextIdentity(),
            new ParticipantEmail($command->email),
            new ParticipantFullName($command->fullName),
        );

        $this->participantRepository->add($participant);

        $this->dispatcher->dispatch($participant);
    }
}
