<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\ValueObject\UserEmail;
use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<UserEmail>
 */
final readonly class CreateUserCommand implements CommandInterface
{
    public function __construct(
        public string $email,
    ) {
    }
}
