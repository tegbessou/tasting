<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<InvitationRepositoryInterface>
 */
final readonly class GetInvitationsQuery implements QueryInterface
{
    public function __construct(
        public ?string $targetEmail = null,
    ) {
    }
}
