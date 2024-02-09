<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Exception;

final class BottleOwnerDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $ownerId,
    ) {
        parent::__construct(sprintf('Owner with id %s does not exist', $this->ownerId));
    }
}
