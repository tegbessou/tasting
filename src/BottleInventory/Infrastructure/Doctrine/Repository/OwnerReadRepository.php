<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\OwnerReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Infrastructure\Doctrine\DoctrineReadRepository;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @extends DoctrineReadRepository<Owner>
 */
final class OwnerReadRepository extends DoctrineReadRepository implements OwnerReadRepositoryInterface
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
    public function exist(OwnerId $id): bool
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $id->value()) !== null;
    }
}
