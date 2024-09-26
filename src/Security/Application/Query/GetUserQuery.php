<?php

declare(strict_types=1);

namespace App\Security\Application\Query;

use App\Security\Domain\Entity\User;
use App\Security\Domain\ValueObject\UserEmail;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<User>
 */
final readonly class GetUserQuery implements QueryInterface
{
    public function __construct(
        public UserEmail $email,
    ) {
    }
}
