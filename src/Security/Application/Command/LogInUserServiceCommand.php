<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\ValueObject\UserServiceLoggedIn;
use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<UserServiceLoggedIn>
 */
final readonly class LogInUserServiceCommand implements CommandInterface
{
    public function __construct(
        public string $email,
        public string $password,
    ) {
    }
}
