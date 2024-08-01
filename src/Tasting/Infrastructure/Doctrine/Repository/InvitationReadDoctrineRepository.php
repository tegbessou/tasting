<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Shared\Infrastructure\Doctrine\DoctrineReadRepository;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Repository\InvitationReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use Symfony\Bridge\Doctrine\Types\UuidType;

/**
 * @extends DoctrineReadRepository<Invitation>
 */
final class InvitationReadDoctrineRepository extends DoctrineReadRepository implements InvitationReadRepositoryInterface
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
        return $this->entityManager->find(self::ENTITY_CLASS, $id->id());
    }

    #[\Override]
    public function withParticipant(ParticipantId $targetId): InvitationReadRepositoryInterface
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
    public function withParticipantAndTasting(ParticipantId $targetId, TastingId $subjectId): InvitationReadRepositoryInterface
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
}
