<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Doctrine\Repository;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Repository\BottleWriteRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottleId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class BottleWriteDoctrineRepository implements BottleWriteRepositoryInterface
{
    private const ENTITY_CLASS = Bottle::class;

    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
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
    public function delete(Bottle $bottle): void
    {
        $this->entityManager->remove($bottle);
        $this->entityManager->flush();
    }
}
