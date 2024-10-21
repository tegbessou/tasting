<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Doctrine\Adapter;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\ReadModel\Bottle;
use Doctrine\ODM\MongoDB\DocumentManager;

final readonly class BottleDoctrineAdapter implements BottleAdapterInterface
{
    public function __construct(
        private DocumentManager $documentManager,
    ) {
    }

    #[\Override]
    public function ofId(string $id): ?Bottle
    {
        return $this->documentManager->find(Bottle::class, $id);
    }

    #[\Override]
    public function add(Bottle $bottle): void
    {
        $this->documentManager->persist($bottle);
        $this->documentManager->flush();
    }

    #[\Override]
    public function update(Bottle $bottle): void
    {
        $this->documentManager->flush();
    }
}
