<?php

declare(strict_types=1);

namespace App\Security\Application\Query;

use App\Security\Application\ReadModel\User;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<User>
 */
final readonly class GetUserQuery implements QueryInterface
{
    public function __construct(
        public string $email,
    ) {
    }
}
