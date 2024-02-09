<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class CreateBottleCommand implements CommandInterface
{
    public function __construct(
        public string $name,
        public string $estateName,
        public string $type,
        public int $year,
        public array $grapeVarieties,
        public string $rate,
        public string $picture,
        public string $ownerId,
        public ?string $country,
        public ?float $price,
    ) {
    }
}
