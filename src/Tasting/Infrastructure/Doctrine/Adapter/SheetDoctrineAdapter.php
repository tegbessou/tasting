<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Adapter;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\ReadModel\Sheet;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ODM\MongoDB\Query\Builder;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\ODM\DoctrineRepository;

/**
 * @extends DoctrineRepository<Sheet>
 */
final class SheetDoctrineAdapter extends DoctrineRepository implements SheetAdapterInterface
{
    private const MODEL_CLASS = Sheet::class;

    public function __construct(
        DocumentManager $documentManager,
    ) {
        parent::__construct($documentManager, self::MODEL_CLASS);
    }

    #[\Override]
    public function ofId(string $id): ?Sheet
    {
        return $this->documentManager->getRepository(self::MODEL_CLASS)->find($id);
    }

    #[\Override]
    public function add(Sheet $sheet): void
    {
        $this->documentManager->persist($sheet);
        $this->documentManager->flush();
    }

    #[\Override]
    public function withTasting(string $tastingId): SheetAdapterInterface
    {
        return $this->filter(static function (Builder $qb) use ($tastingId): void {
            $qb->field('tastingId')->equals($tastingId);
        });
    }

    #[\Override]
    public function withParticipant(string $participantId): SheetAdapterInterface
    {
        return $this->filter(static function (Builder $qb) use ($participantId): void {
            $qb->field('participantId')->equals($participantId);
        });
    }

    #[\Override]
    public function update(Sheet $sheet): void
    {
        $this->documentManager->flush();
    }
}
