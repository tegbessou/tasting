<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Repository\ParticipantWriteRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class ParticipantWriteDoctrineRepository implements ParticipantWriteRepositoryInterface
{
    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofId(ParticipantId $id): ?Participant
    {
        return $this->entityManager->find(
            Participant::class,
            $id
        );
    }

    #[\Override]
    public function add(
        Participant $participant
    ): void {
        $this->entityManager->persist($participant);
        $this->entityManager->flush();
    }

    #[\Override]
    public function nextIdentity(): ParticipantId
    {
        return ParticipantId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }
}
