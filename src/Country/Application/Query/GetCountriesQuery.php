<?php

declare(strict_types=1);

namespace App\Country\Application\Query;

use App\Country\Domain\Repository\CountryReadRepositoryInterface;
use App\Shared\Application\Query\QueryInterface;

/**
 * @implements QueryInterface<CountryReadRepositoryInterface>
 */
final readonly class GetCountriesQuery implements QueryInterface
{
    public function __construct(
        public ?string $name = null,
        public ?int $page = null,
        public ?int $limit = null,
    ) {
    }
}
