<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Event;

use TegCorp\SharedKernelBundle\Domain\Event\DomainEvent;
use TegCorp\SharedKernelBundle\Domain\Event\DomainEventInterface;

final class MouthAdded extends DomainEvent implements DomainEventInterface
{
    public function __construct(
        public string $sheetId,
        public string $alcool,
        public string $acide,
        public string $matiere,
        public string $finale,
        public string $observation,
        public ?string $tanin = null,
        public ?string $sucre = null,
    ) {
        parent::__construct();
    }
}
