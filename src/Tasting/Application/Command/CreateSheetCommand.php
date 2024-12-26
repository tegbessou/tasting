<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class CreateSheetCommand implements CommandInterface
{
    public function __construct(
        public string $tastingId,
        public string $participant,
    ) {
    }
}
