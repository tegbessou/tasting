<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class TastingDeleted extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $tastingId,
    ) {
        parent::__construct();
    }
}
