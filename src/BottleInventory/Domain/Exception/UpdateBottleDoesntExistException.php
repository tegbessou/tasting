<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Exception;

final class UpdateBottleDoesntExistException extends \Exception
{
    public function __construct(
        public string $bottleId,
    ) {
        parent::__construct();
    }
}
