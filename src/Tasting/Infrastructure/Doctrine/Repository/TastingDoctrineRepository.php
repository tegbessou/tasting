<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use App\Tasting\Infrastructure\Doctrine\Mapper\TastingMapper;
use Doctrine\ORM\EntityManagerInterface;

final readonly class TastingDoctrineRepository implements TastingRepositoryInterface
{
    private const ENTITY_CLASS = TastingDoctrine::class;

    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofId(TastingId $id): ?Tasting
    {
        $tastingDoctrine = $this->entityManager->find(self::ENTITY_CLASS, $id->value());

        if ($tastingDoctrine === null) {
            return null;
        }

        return TastingMapper::toDomain($tastingDoctrine);
    }

    #[\Override]
    public function add(Tasting $tasting): void
    {
        $tastingDoctrine = TastingMapper::toInfrastructurePersist($tasting);

        $this->entityManager->persist($tastingDoctrine);
        $this->entityManager->flush();
    }

    #[\Override]
    public function update(Tasting $tasting): void
    {
        $tastingOrm = $this->entityManager->getRepository(self::ENTITY_CLASS)->find($tasting->id()->value());

        if ($tastingOrm === null) {
            throw new \LogicException('TastingDoctrineRepository Tasting must exist in doctrine.');
        }

        TastingMapper::toInfrastructureUpdate($tasting, $tastingOrm);

        $this->entityManager->flush();
    }

    #[\Override]
    public function delete(Tasting $tasting): void
    {
        $tastingOrm = $this->entityManager->getRepository(self::ENTITY_CLASS)->find($tasting->id()->value());

        if ($tastingOrm === null) {
            throw new \LogicException('TastingDoctrineRepository Tasting must exist in doctrine.');
        }

        $this->entityManager->remove($tastingOrm);
        $this->entityManager->flush();
    }
}
