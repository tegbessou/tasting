<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Doctrine\Repository;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Repository\BottleRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleSavedAt;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Shared\Infrastructure\Doctrine\DoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use Symfony\Component\Uid\Uuid;

/**
 * @extends DoctrineRepository<Bottle>
 */
final class BottleDoctrineRepository extends DoctrineRepository implements BottleRepositoryInterface
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

    #[\Override]
    public function update(Bottle $bottle): void
    {
        $this->entityManager->flush();
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
    public function withEstateName(BottleEstateName $estateName): BottleRepositoryInterface
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
    public function withYear(BottleYear $year): BottleRepositoryInterface
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
    public function withRate(BottleRate $rate): BottleRepositoryInterface
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
    public function savedAt(BottleSavedAt $savedAt): BottleRepositoryInterface
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
    public function withWineType(BottleWineType $wineType): BottleRepositoryInterface
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
