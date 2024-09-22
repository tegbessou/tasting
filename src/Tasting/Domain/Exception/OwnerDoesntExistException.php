<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class OwnerDoesntExistException extends \Exception
{
    public function __construct(
        public string $ownerEmail,
    ) {
        parent::__construct(sprintf('Owner with email %s doesn\'t exist', $ownerEmail));
    }
}
