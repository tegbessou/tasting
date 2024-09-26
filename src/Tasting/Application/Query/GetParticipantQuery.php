<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Tasting\Domain\Entity\Participant;
use TegCorp\SharedKernelBundle\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<Participant|null>
 */
final readonly class GetParticipantQuery implements QueryInterface
{
    public function __construct(
        public string $id,
    ) {
    }
}
