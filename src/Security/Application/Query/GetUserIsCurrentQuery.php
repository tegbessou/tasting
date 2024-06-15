<?php

declare(strict_types=1);

namespace App\Security\Application\Query;

use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserIsCurrent;
use App\Shared\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<UserIsCurrent|null>
 */
final readonly class GetUserIsCurrentQuery implements QueryInterface
{
    public function __construct(
        public UserEmail $email,
    ) {
    }
}
