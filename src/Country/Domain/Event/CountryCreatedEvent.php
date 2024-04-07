<?php

declare(strict_types=1);

namespace App\Country\Domain\Event;

use App\Shared\Domain\Event\DomainEventInterface;

final readonly class CountryCreatedEvent implements DomainEventInterface
{
    public function __construct(
        public string $countryId,
    ) {
    }
}
