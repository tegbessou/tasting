<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class NoseUpdated extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $sheetId,
        public string $impression,
        public string $intensite,
        public string $arome,
        public string $observation,
    ) {
        parent::__construct();
    }
}
