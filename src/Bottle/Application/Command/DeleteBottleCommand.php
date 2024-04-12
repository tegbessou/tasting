<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class DeleteBottleCommand implements CommandInterface
{
    public function __construct(
        public string $id,
    ) {
    }
}
