<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Shared\Application\Query\QueryInterface;
use App\Tasting\Domain\Repository\InvitationReadRepositoryInterface;

/**
 * @implements QueryInterface<InvitationReadRepositoryInterface>
 */
final readonly class GetInvitationsQuery implements QueryInterface
{
    public function __construct(
        public ?string $targetEmail = null,
    ) {
    }
}
