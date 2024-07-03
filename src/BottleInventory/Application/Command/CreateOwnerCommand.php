<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class CreateOwnerCommand implements CommandInterface
{
    public function __construct(
        public string $email,
        public string $fullName,
    ) {
    }
}
