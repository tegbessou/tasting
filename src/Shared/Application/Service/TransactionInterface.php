<?php

declare(strict_types=1);

namespace App\Shared\Application\Service;

interface TransactionInterface
{
    public function begin(): void;

    public function commit(): void;

    public function rollback(): void;
}
