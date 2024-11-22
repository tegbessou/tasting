<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<InvitationAdapterInterface>
 */
final readonly class GetInvitationsQuery implements QueryInterface
{
    public function __construct(
        public ?string $targetId = null,
    ) {
    }
}
