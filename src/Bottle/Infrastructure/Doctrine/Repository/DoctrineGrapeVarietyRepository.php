<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Doctrine\Repository;

use App\Bottle\Domain\Entity\GrapeVariety;
use App\Bottle\Domain\Repository\GrapeVarietyRepositoryInterface;
use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use App\Shared\Infrastructure\Doctrine\DoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @extends DoctrineRepository<GrapeVariety>
 */
final class DoctrineGrapeVarietyRepository extends DoctrineRepository implements GrapeVarietyRepositoryInterface
{
    private const ENTITY_CLASS = GrapeVariety::class;
    private const ALIAS = 'grape_variety';

    public function __construct(
        EntityManagerInterface $entityManager,
    ) {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function exist(GrapeVarietyName $name): bool
    {
        return $this->entityManager->createQueryBuilder()
            ->select('1')
            ->from(self::ENTITY_CLASS, self::ALIAS)
            ->where(sprintf('%s.name.value = :name', self::ALIAS))
            ->setParameter('name', $name->value())
            ->getQuery()
            ->getOneOrNullResult() !== null;
    }
}
