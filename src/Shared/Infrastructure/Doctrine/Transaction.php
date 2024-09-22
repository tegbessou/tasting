<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Doctrine;

use App\Shared\Application\Service\TransactionInterface;
use Doctrine\ORM\EntityManagerInterface;

final readonly class Transaction implements TransactionInterface
{
    public function __construct(
        private EntityManagerInterface $entityManager
    ) {
    }

    #[\Override]
    public function begin(): void
    {
        $this->entityManager->beginTransaction();
    }

    #[\Override]
    public function commit(): void
    {
        $this->entityManager->commit();
    }

    #[\Override]
    public function rollback(): void
    {
        $this->entityManager->rollback();
    }
}