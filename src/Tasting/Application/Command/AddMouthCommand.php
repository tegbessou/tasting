<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class AddMouthCommand implements CommandInterface
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
    }
}
