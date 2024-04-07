<?php

declare(strict_types=1);

namespace App\Shared\Domain\Service;

use App\Shared\Domain\Entity\EntityWithDomainEventInterface;

interface DomainEventDispatcherInterface
{
    public function dispatch(EntityWithDomainEventInterface $entity): void;
}
