<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class CreateUserCommand implements CommandInterface
{
    public function __construct(
        public string $email,
    ) {
    }
}
