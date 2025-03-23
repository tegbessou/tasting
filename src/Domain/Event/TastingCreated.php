<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class TastingCreated extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $tastingId,
        public string $bottleName,
        public string $bottleWineType,
        public string $ownerId,
        /** @var string[] $participants */
        public array $participants,
    ) {
        parent::__construct();
    }
}
