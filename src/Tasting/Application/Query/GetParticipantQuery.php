<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Shared\Application\Query\QueryInterface;
use App\Tasting\Domain\Entity\Participant;

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
