<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Adapter;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Application\ReadModel\Tasting;
use Doctrine\ODM\MongoDB\DocumentManager;

final readonly class TastingDoctrineAdapter implements TastingAdapterInterface
{
    public function __construct(
        private DocumentManager $documentManager,
    ) {
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
}
