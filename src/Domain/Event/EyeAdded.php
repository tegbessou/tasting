<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class EyeAdded extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $sheetId,
        public string $limpidite,
        public string $brillance,
        public string $intensiteCouleur,
        public string $teinte,
        public string $larme,
        public string $observation,
    ) {
        parent::__construct();
    }
}
