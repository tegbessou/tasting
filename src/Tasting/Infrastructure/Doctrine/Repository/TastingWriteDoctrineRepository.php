<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingWriteRepositoryInterface;
use App\Tasting\Domain\ValueObject\TastingId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class TastingWriteDoctrineRepository implements TastingWriteRepositoryInterface
{
    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofId(TastingId $id): ?Tasting
    {
        return $this->entityManager->find(
            Tasting::class,
            $id,
        );
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
