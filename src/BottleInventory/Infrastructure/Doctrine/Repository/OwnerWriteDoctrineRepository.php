<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\OwnerWriteRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class OwnerWriteDoctrineRepository implements OwnerWriteRepositoryInterface
{
    private const ENTITY_CLASS = Owner::class;

    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofId(OwnerId $ownerId): ?Owner
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $ownerId->value());
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
