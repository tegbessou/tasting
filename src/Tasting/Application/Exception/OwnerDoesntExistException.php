<?php

declare(strict_types=1);

namespace App\Tasting\Application\Exception;

final class OwnerDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $ownerId,
    ) {
        parent::__construct(sprintf('Owner %s does not exist', $this->ownerId));
    }
}
