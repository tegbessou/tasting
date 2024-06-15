<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Exception;

final class BottleDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $bottleId,
    ) {
        parent::__construct(sprintf('Bottle %s does not exist', $this->bottleId));
    }
}
