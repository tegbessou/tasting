<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Repository\InvitationWriteRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class InvitationWriteDoctrineRepository implements InvitationWriteRepositoryInterface
{
    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofId(InvitationId $id): ?Invitation
    {
        return $this->entityManager->find(Invitation::class, $id);
    }

    #[\Override]
    public function add(Invitation $invitation): void
    {
        $this->entityManager->persist($invitation);
        $this->entityManager->flush();
    }

    #[\Override]
    public function nextIdentity(): InvitationId
    {
        return InvitationId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }

    #[\Override]
    public function update(): void
    {
        $this->entityManager->flush();
    }

    #[\Override]
    public function delete(Invitation $invitation): void
    {
        $this->entityManager->remove($invitation);
        $this->entityManager->flush();
    }
}
