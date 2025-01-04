<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Adapter;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Application\ReadModel\Tasting;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ODM\MongoDB\Query\Builder;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\ODM\DoctrineRepository;

/**
 * @extends DoctrineRepository<Tasting>
 */
final class TastingDoctrineAdapter extends DoctrineRepository implements TastingAdapterInterface
{
    private const MODEL_CLASS = Tasting::class;

    public function __construct(
        DocumentManager $documentManager,
    ) {
        parent::__construct($documentManager, self::MODEL_CLASS);
    }

    #[\Override]
    public function ofId(string $id): ?Tasting
    {
        return $this->documentManager->find(Tasting::class, $id);
    }

    #[\Override]
    public function add(Tasting $tasting): void
    {
        $this->documentManager->persist($tasting);
        $this->documentManager->flush();
    }

    #[\Override]
    public function withBottleName(string $bottleName): TastingAdapterInterface
    {
        return $this->filter(static function (Builder $qb) use ($bottleName): void {
            $qb->field('bottleName')->equals($bottleName);
        });
    }

    #[\Override]
    public function delete(Tasting $tasting): void
    {
        $this->documentManager->remove($tasting);
        $this->documentManager->flush();
    }
}
