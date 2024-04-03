<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\Doctrine\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\Repository\CountryReadRepositoryInterface;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Infrastructure\Doctrine\DoctrineReadRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use Symfony\Component\Uid\Uuid;

/**
 * @extends DoctrineReadRepository<Country>
 */
final class CountryReadDoctrineRepository extends DoctrineReadRepository implements CountryReadRepositoryInterface
{
    private const ENTITY_CLASS = Country::class;
    private const ALIAS = 'country';

    public function __construct(EntityManagerInterface $entityManager)
    {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function ofName(
        CountryName $name,
    ): ?Country {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->findOneBy(['name.value' => $name->value()]);
    }

    #[\Override]
    public function exist(CountryName $name): bool
    {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->findOneBy(['name.value' => $name->value()]) !== null;
    }

    #[\Override]
    public function nextIdentity(): CountryId
    {
        return CountryId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }

    #[\Override]
    public function add(Country $country): void
    {
        $this->entityManager->persist($country);
        $this->entityManager->flush();
    }

    #[\Override]
    public function withName(
        CountryName $name,
    ): self {
        return $this->filter(static function (QueryBuilder $qb) use ($name): void {
            $qb->where(sprintf('%s.name.value = :name', self::ALIAS))->setParameter('name', $name->value());
        });
    }

    #[\Override]
    public function sortName(): self
    {
        return $this->filter(static function (QueryBuilder $qb): void {
            $qb->orderBy(sprintf('%s.name.value', self::ALIAS), 'ASC');
        });
    }
}
