<?php

declare(strict_types=1);

namespace App\User\Application\Query;

use App\Shared\Application\Query\QueryInterface;
use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\Email;

/**
 * @implements QueryInterface<User>
 */
final readonly class GetUserQuery implements QueryInterface
{
    public function __construct(
        public Email $email,
    ) {
    }
}
