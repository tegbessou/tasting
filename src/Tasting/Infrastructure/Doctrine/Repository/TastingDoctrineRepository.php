<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use Symfony\Component\Uid\Uuid;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\DoctrineRepository;

/**
 * @extends DoctrineRepository<Tasting>
 */
final class TastingDoctrineRepository extends DoctrineRepository implements TastingRepositoryInterface
{
    private const ENTITY_CLASS = Tasting::class;
    private const ALIAS = 'tasting';

    public function __construct(
        EntityManagerInterface $entityManager,
    ) {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function ofId(TastingId $id): ?Tasting
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $id);
    }

    #[\Override]
    public function withBottle(BottleName $name): self
    {
        return $this->filter(static function (QueryBuilder $qb) use ($name): void {
            $qb->where(
                sprintf(
                    '%s.bottleName.name = :name',
                    self::ALIAS))
                ->setParameter(
                    'name',
                    $name->value(),
                )
            ;
        });
    }

    #[\Override]
    public function add(Tasting $tasting): void
    {
        $this->entityManager->persist($tasting);
        $this->entityManager->flush();
    }

    #[\Override]
    public function nextIdentity(): TastingId
    {
        return TastingId::fromString(
            Uuid::v4()->toRfc4122(),
        );
    }

    #[\Override]
    public function update(): void
    {
        $this->entityManager->flush();
    }
}
