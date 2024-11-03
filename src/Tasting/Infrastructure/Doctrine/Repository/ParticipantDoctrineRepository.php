<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\ORM\DoctrineRepository;

/**
 * @extends DoctrineRepository<Participant>
 */
final class ParticipantDoctrineRepository extends DoctrineRepository implements ParticipantRepositoryInterface
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

    #[\Override]
    public function add(
        Participant $participant,
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
