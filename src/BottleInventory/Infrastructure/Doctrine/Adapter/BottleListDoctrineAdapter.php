<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Doctrine\Adapter;

use App\BottleInventory\Application\Adapter\BottleListAdapterInterface;
use App\BottleInventory\Application\ReadModel\BottleList;
use Doctrine\ODM\MongoDB\DocumentManager;

final readonly class BottleListDoctrineAdapter implements BottleListAdapterInterface
{
    public function __construct(
        private DocumentManager $documentManager,
    ) {
    }

    #[\Override]
    public function ofId(string $id): ?BottleList
    {
        return $this->documentManager->find(BottleList::class, $id);
    }

    #[\Override]
    public function add(BottleList $bottle): void
    {
        $this->documentManager->persist($bottle);
        $this->documentManager->flush();
    }

    #[\Override]
    public function update(BottleList $bottle): void
    {
        $this->documentManager->flush();
    }
}
