<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Shared\Infrastructure\Doctrine\DoctrineReadRepository;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleId;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use Symfony\Bridge\Doctrine\Types\UuidType;

/**
 * @extends DoctrineReadRepository<Tasting>
 */
final class TastingReadDoctrineRepository extends DoctrineReadRepository implements TastingReadRepositoryInterface
{
    private const ENTITY_CLASS = Tasting::class;
    private const ALIAS = 'tasting';

    public function __construct(
        EntityManagerInterface $entityManager,
    ) {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function withBottle(BottleId $id): self
    {
        return $this->filter(static function (QueryBuilder $qb) use ($id): void {
            $qb->where(
                sprintf(
                    '%s.bottleId.id = :id',
                    self::ALIAS))
                ->setParameter(
                    'id',
                    $id->id(),
                    UuidType::NAME,
                )
            ;
        });
    }
}
