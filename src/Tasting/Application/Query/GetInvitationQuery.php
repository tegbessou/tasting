<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Shared\Application\Query\QueryInterface;
use App\Tasting\Domain\Entity\Invitation;

/**
 * @implements QueryInterface<Invitation|null>
 */
final readonly class GetInvitationQuery implements QueryInterface
{
    public function __construct(
        public string $id,
    ) {
    }
}
