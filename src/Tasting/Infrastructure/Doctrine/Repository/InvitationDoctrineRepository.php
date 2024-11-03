<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\Uid\Uuid;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\ORM\DoctrineRepository;

/**
 * @extends DoctrineRepository<Invitation>
 */
final class InvitationDoctrineRepository extends DoctrineRepository implements InvitationRepositoryInterface
{
    private const ENTITY_CLASS = Invitation::class;
    private const ALIAS = 'invitation';

    public function __construct(EntityManagerInterface $entityManager)
    {
        parent::__construct($entityManager, self::ENTITY_CLASS, self::ALIAS);
    }

    #[\Override]
    public function ofId(InvitationId $id): ?Invitation
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $id->value());
    }

    #[\Override]
    public function sortCreatedAt(): self
    {
        return $this->filter(static function (QueryBuilder $qb): void {
            $qb->orderBy(sprintf('%s.createdAt.createdAt', self::ALIAS), 'DESC');
        });
    }

    #[\Override]
    public function withParticipant(ParticipantId $targetId): InvitationRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($targetId): void {
            $qb->where(
                sprintf(
                    '%s.target = :targetId',
                    self::ALIAS))
                ->setParameter(
                    'targetId',
                    $targetId->value(),
                    UuidType::NAME,
                )
            ;
        });
    }

    #[\Override]
    public function withParticipantAndTasting(ParticipantId $targetId, TastingId $subjectId): InvitationRepositoryInterface
    {
        return $this->filter(static function (QueryBuilder $qb) use ($targetId, $subjectId): void {
            $qb->where(
                sprintf(
                    '%s.target = :targetId',
                    self::ALIAS))
                ->setParameter(
                    'targetId',
                    $targetId->value(),
                    UuidType::NAME,
                )
                ->andWhere(
                    sprintf(
                        '%s.subject = :subjectId',
                        self::ALIAS))
                ->setParameter(
                    'subjectId',
                    $subjectId->value(),
                    UuidType::NAME,
                )
            ;
        });
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
