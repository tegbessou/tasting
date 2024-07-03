<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Exception;

final class OwnerDoesntExistInSecurityException extends \Exception
{
    public function __construct(
        public readonly string $email,
    ) {
        parent::__construct(sprintf('Owner %s does not exist', $this->email));
    }
}
