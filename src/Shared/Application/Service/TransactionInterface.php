<?php

namespace App\Shared\Application\Service;

interface TransactionInterface
{
    public function begin(): void;

    public function commit(): void;

    public function rollback(): void;
}