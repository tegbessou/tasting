<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Adapter;

use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ODM\MongoDB\Query\Builder;
use EmpireDesAmis\Tasting\Application\Adapter\InvitationAdapterInterface;
use EmpireDesAmis\Tasting\Application\ReadModel\Invitation;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\ODM\DoctrineRepository;

/**
 * @extends DoctrineRepository<Invitation>
 */
final class InvitationDoctrineAdapter extends DoctrineRepository implements InvitationAdapterInterface
{
    private const MODEL_CLASS = Invitation::class;

    public function __construct(
        DocumentManager $documentManager,
    ) {
        parent::__construct($documentManager, self::MODEL_CLASS);
    }

    #[\Override]
    public function ofId(string $id): ?Invitation
    {
        return $this->documentManager->getRepository(Invitation::class)->find($id);
    }

    #[\Override]
    public function add(Invitation $invitation): void
    {
        $this->documentManager->persist($invitation);
        $this->documentManager->flush();
    }

    #[\Override]
    public function sortCreatedAt(): self
    {
        return $this->filter(static function (Builder $qb): void {
            $qb->sort('createdAt', 'DESC');
        });
    }

    #[\Override]
    public function withTarget(string $targetId): InvitationAdapterInterface
    {
        return $this->filter(static function (Builder $qb) use ($targetId): void {
            $qb->field('targetId')->equals($targetId);
        });
    }

    #[\Override]
    public function withTargetAndSubject(string $targetId, string $subjectId): InvitationAdapterInterface
    {
        return $this->filter(static function (Builder $qb) use ($targetId, $subjectId): void {
            $qb->field('targetId')->equals($targetId);
            $qb->field('subjectId')->equals($subjectId);
        });
    }

    #[\Override]
    public function delete(Invitation $invitation): void
    {
        $this->documentManager->remove($invitation);
        $this->documentManager->flush();
    }

    #[\Override]
    public function update(): void
    {
        $this->documentManager->flush();
    }
}
