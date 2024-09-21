<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\OwnerRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Infrastructure\Doctrine\DoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

/**
 * @extends DoctrineRepository<Owner>
 */
final class OwnerDoctrineRepository extends DoctrineRepository implements OwnerRepositoryInterface
{
    private const ENTITY_CLASS = Owner::class;
    private const ALIAS = 'owner';

    public function __construct(
        EntityManagerInterface $entityManager,
    ) {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function ofId(OwnerId $id): ?Owner
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $id->value());
    }

    #[\Override]
    public function ofEmail(OwnerEmail $email): ?Owner
    {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->createQueryBuilder('o')
            ->where('o.email.value = :email')
            ->setParameter('email', $email->value())
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }

    #[\Override]
    public function exist(OwnerId $id): bool
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $id->value()) !== null;
    }

    #[\Override]
    public function add(Owner $owner): void
    {
        $this->entityManager->persist($owner);
        $this->entityManager->flush();
    }

    #[\Override]
    public function nextIdentity(): OwnerId
    {
        return OwnerId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }
}
