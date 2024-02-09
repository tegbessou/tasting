<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Doctrine\Repository;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Repository\BottleRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Shared\Infrastructure\Doctrine\DoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

/**
 * @extends DoctrineRepository<Bottle>
 */
final class DoctrineBottleRepository extends DoctrineRepository implements BottleRepositoryInterface
{
    private const ENTITY_CLASS = Bottle::class;
    private const ALIAS = 'bottle';

    public function __construct(
        EntityManagerInterface $entityManager,
    ) {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function ofId(BottleId $bottleId): ?Bottle
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $bottleId->value());
    }

    #[\Override]
    public function add(Bottle $bottle): void
    {
        $this->entityManager->persist($bottle);
        $this->entityManager->flush();
    }

    #[\Override]
    public function nextIdentity(): BottleId
    {
        return BottleId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }
}
