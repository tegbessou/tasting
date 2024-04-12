<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Doctrine\Repository;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Repository\BottleReadRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\BottleEstateName;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottleName;
use App\BottleInventory\Domain\ValueObject\BottleRate;
use App\BottleInventory\Domain\ValueObject\BottleSavedAt;
use App\BottleInventory\Domain\ValueObject\BottleWineType;
use App\BottleInventory\Domain\ValueObject\BottleYear;
use App\Shared\Infrastructure\Doctrine\DoctrineReadRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;

/**
 * @extends DoctrineReadRepository<Bottle>
 */
final class BottleReadDoctrineRepository extends DoctrineReadRepository implements BottleReadRepositoryInterface
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
    public function sortName(): self
    {
        return $this->filter(static function (QueryBuilder $qb): void {
            $qb->orderBy(sprintf('%s.name.value', self::ALIAS), 'ASC');
        });
    }

    #[\Override]
    public function withName(BottleName $name): self
    {
        return $this->filter(static function (QueryBuilder $qb) use ($name): void {
            $qb->where(
                sprintf(
                    '%s.name.value LIKE :name',
                    self::ALIAS))
                ->setParameter(
                    'name',
                    sprintf('%%%s%%', $name->value())
                )
            ;
        });
    }

    #[\Override]
    public function withEstateName(BottleEstateName $estateName): BottleReadRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($estateName): void {
            $qb->where(
                sprintf(
                    '%s.estateName.value LIKE :estateName',
                    self::ALIAS))
                ->setParameter(
                    'estateName',
                    sprintf('%%%s%%', $estateName->value())
                )
            ;
        });
    }

    #[\Override]
    public function withYear(BottleYear $year): BottleReadRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($year): void {
            $qb->where(
                sprintf(
                    '%s.year.value = :year',
                    self::ALIAS))
                ->setParameter(
                    'year',
                    sprintf('%d', $year->value())
                )
            ;
        });
    }

    #[\Override]
    public function withRate(BottleRate $rate): BottleReadRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($rate): void {
            $qb->where(
                sprintf(
                    '%s.rate.value = :rate',
                    self::ALIAS))
                ->setParameter(
                    'rate',
                    sprintf('%s', $rate->value())
                )
            ;
        });
    }

    #[\Override]
    public function savedAt(BottleSavedAt $savedAt): BottleReadRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($savedAt): void {
            $qb->where(
                sprintf(
                    '%s.savedAt.date = :savedAt',
                    self::ALIAS))
                ->setParameter(
                    'savedAt',
                    sprintf('%s', $savedAt->dateUs())
                )
            ;
        });
    }

    #[\Override]
    public function withWineType(BottleWineType $wineType): BottleReadRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($wineType): void {
            $qb->where(
                sprintf(
                    '%s.wineType.value = :wineType',
                    self::ALIAS))
                ->setParameter(
                    'wineType',
                    sprintf('%s', $wineType->value())
                )
            ;
        });
    }
}
