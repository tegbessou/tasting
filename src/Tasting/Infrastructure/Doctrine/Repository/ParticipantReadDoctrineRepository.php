<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Shared\Infrastructure\Doctrine\DoctrineReadRepository;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Repository\ParticipantReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantId;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @extends DoctrineReadRepository<Participant>
 */
final class ParticipantReadDoctrineRepository extends DoctrineReadRepository implements ParticipantReadRepositoryInterface
{
    private const ENTITY_CLASS = Participant::class;
    private const ALIAS = 'participant';

    public function __construct(
        EntityManagerInterface $entityManager,
    ) {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function ofId(ParticipantId $id): ?Participant
    {
        return $this->entityManager->find(Participant::class, $id);
    }

    #[\Override]
    public function ofEmail(ParticipantEmail $email): ?Participant
    {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->createQueryBuilder('p')
            ->where('p.email.value = :email')
            ->setParameter('email', $email->value())
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }

    #[\Override]
    public function exist(ParticipantId $id): bool
    {
        return $this->entityManager->find(Participant::class, $id) !== null;
    }
}
